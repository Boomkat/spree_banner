class RemoveCategoryFromBanners < ActiveRecord::Migration
  def change
    remove_column :spree_banner_boxes,  :category
    remove_column :spree_banner_boxes,  :category_id

  end
end
