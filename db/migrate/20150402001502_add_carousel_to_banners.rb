class AddCarouselToBanners < ActiveRecord::Migration
  def change
    add_column :spree_banner_boxes,  :carousel, :boolean
  end
end
