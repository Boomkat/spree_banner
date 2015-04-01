class CreateBannerBoxLocations < ActiveRecord::Migration
  def change
    create_table :spree_banner_box_locations do |t|
      t.string :location
      t.string :page
      t.boolean :enabled, :default => false
      t.references :spree_banner_boxes, index:true
      t.timestamps
    end
  end
end
