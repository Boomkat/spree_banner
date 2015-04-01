module Spree
  class BannerBoxLocation < ActiveRecord::Base

    has_many :banner_box, dependent: :destroy, class_name: 'BannerBox'

    validates_presence_of :page
    validates_presence_of :location

    def banner_box_for_location(location)
      self.where(:location => location).first
    end

    def banner_box_for_location_carousel(location)
      self.where(:location => location)
    end

    def page_location
      "#{page} - #{location}".capitalize!
    end

  end
end