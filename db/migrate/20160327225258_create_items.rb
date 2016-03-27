class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :description, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.timestamps
    end
  end
end
