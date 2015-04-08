class AddIdToBanners < ActiveRecord::Migration
  def change
    add_column :spree_banner_boxes,  :category_id, :integer
  end
end
