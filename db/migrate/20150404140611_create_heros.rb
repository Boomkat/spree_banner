class CreateHeros < ActiveRecord::Migration
  def change
  create_table :spree_banner_box_heros do |t|
      t.string :alt_text, :url
      t.integer :position
      t.integer :position
      t.boolean :enabled, :default => false

      t.string   :attachment_content_type, :attachment_file_name
      t.datetime :attachment_updated_at
      t.integer  :attachment_width, :attachment_height
      t.integer  :attachment_size
      t.integer :banner_box_location_id
      t.timestamps
    end
  end
end
