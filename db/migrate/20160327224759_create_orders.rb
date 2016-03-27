class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :party_name, null: false
      t.integer :party_size, null: false
      t.integer :table_number, null: false
      t.boolean :completed, default: false
      t.string :special
      t.references :user, null: false
      t.timestamps
    end
  end
end
