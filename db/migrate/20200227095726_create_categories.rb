class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :user_id
      t.string :name
      t.string :cat_link
      t.text :cat_description
      t.boolean :display_in_navbar, default: true

      t.string :cat_spare_01
      t.string :cat_spare_02
      t.string :cat_spare_03
      t.string :cat_spare_04
      t.string :cat_spare_05

      t.timestamps
    end
  end
end
