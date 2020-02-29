class CreateGuides < ActiveRecord::Migration[5.2]
  def change
    create_table :guides do |t|
      t.string :name
      t.text :g_description
      t.boolean :display_in_navbar, default: true

      t.timestamps
    end
  end
end
