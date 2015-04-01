class AddLocationIdToBanners < ActiveRecord::Migration
  def change
    add_column :spree_banner_boxes,  :banner_box_location_id, :integer
  end
end
