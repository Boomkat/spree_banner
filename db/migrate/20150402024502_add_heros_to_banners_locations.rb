class AddHerosToBannersLocations < ActiveRecord::Migration
  def change
    add_column :spree_banner_box_locations,  :spree_banner_box_heros_id, :integer
  end
end
