class AddBannerCaptionsAndStyleToBanners < ActiveRecord::Migration
  def change
    add_column :spree_banner_boxes, :banner_text, :text
    add_column :spree_banner_box_heros, :banner_text, :text

    add_column :spree_banner_boxes, :banner_style, :string
    add_column :spree_banner_box_heros,  :banner_style, :string
  end
end
