class CreateGuides < ActiveRecord::Migration[5.2]
  def change
    create_table :guides do |t|
      t.string :name
      t.string :g_link
      t.text :g_description
      t.boolean :display_in_navbar, default: true

      t.string :g_spare_01
      t.string :g_spare_02
      t.string :g_spare_03
      t.string :g_spare_04
      t.string :g_spare_05

      t.timestamps
    end
  end
end
