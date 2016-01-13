module Spree
  class BannerBox < ActiveRecord::Base
    acts_as_list scope: [:position]
    belongs_to :banner_box_location

    validate :no_attachment_errors
    validates_presence_of :banner_box_location

    has_attached_file :attachment,
                      styles: { mini: '48x48>', small: '100x100>', product: '240x240>', large: '600x600>' },
                      storage: :s3,
                      default_style: :banner,
                      path: '/spree/banners/:id/:style/:basename.:extension',
                      default_url: "/spree/:class/:id/:style/:basename.:extension",
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' },
                      s3_protocol:    "https",
                      url:            ":s3_alias_url",
                      use_timestamp:  false,
                      attachment_url: ":s3_eu_url",
                      s3_host_alias: 	"assets.boomkat.com",
                      s3_credentials: Proc.new{|a| a.instance.s3_credentials }

    validates_attachment :attachment,
                         :presence => true,
                         :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

    # save the w,h of the original image (from which others can be calculated)
    # we need to look at the write-queue for images which have not been saved yet
    after_post_process :find_dimensions

    validates_attachment_content_type :attachment, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg', 'image/x-png', 'image/pjpeg'], :message => I18n.t(:images_only)

    scope :enabled, where(:enabled => true)
    #
    # # Load user defined paperclip settings

    # Spree::BannerBox.attachment_definitions[:attachment][:styles] = ActiveSupport::JSON.decode(SpreeBanner::Config[:banner_styles]).symbolize_keys!
    # Spree::BannerBox.attachment_definitions[:attachment][:path] = SpreeBanner::Config[:banner_path]
    # Spree::BannerBox.attachment_definitions[:attachment][:url] = SpreeBanner::Config[:banner_url]
    # Spree::BannerBox.attachment_definitions[:attachment][:default_url] = SpreeBanner::Config[:banner_default_url]
    # Spree::BannerBox.attachment_definitions[:attachment][:default_style] = SpreeBanner::Config[:banner_default_style]

    # for adding banner_boxes which are closely related to existing ones
    # define "duplicate_extra" for site-specific actions, eg for additional fields
    def duplicate
      enhance_settings
      p = self.dup
      p.category = 'COPY OF ' + category
      p.created_at = p.updated_at = nil
      p.url = url
      p.attachment = attachment

      # allow site to do some customization
      p.send(:duplicate_extra, self) if p.respond_to?(:duplicate_extra)
      p.save!
      p
    end

    def find_dimensions
      temporary = attachment.queued_for_write[:original]
      filename = temporary.path unless temporary.nil?
      filename = attachment.path if filename.blank?
      geometry = Paperclip::Geometry.from_file(filename)
      self.attachment_width = geometry.width
      self.attachment_height = geometry.height
    end

    def enhance_settings
      extended_hash = {}
      ActiveSupport::JSON.decode(SpreeBanner::Config[:banner_styles]).each do |key,value|
        extended_hash[:"#{key}"] = value
      end
      Spree::BannerBox.attachment_definitions[:attachment][:styles] = extended_hash
      Spree::BannerBox.attachment_definitions[:attachment][:path] = SpreeBanner::Config[:banner_path]
      Spree::BannerBox.attachment_definitions[:attachment][:url] = SpreeBanner::Config[:banner_url]
      Spree::BannerBox.attachment_definitions[:attachment][:default_url] = SpreeBanner::Config[:banner_default_url]
      Spree::BannerBox.attachment_definitions[:attachment][:default_style] = SpreeBanner::Config[:banner_default_style]
    end

    # if there are errors from the plugin, then add a more meaningful message
    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end

    def s3_credentials
      {:bucket => ENV['AWS_S3_BUCKET_NAME'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
    end
  end


end
