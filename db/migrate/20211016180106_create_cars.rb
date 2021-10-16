class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.integer :status, default: 0
      t.string :name
      t.string :description
      t.datetime :manufactured_at, null: false
      t.decimal :table_price, precision: 18, scale: 2, default: '0.0', null: false

      t.timestamps
    end
  end
end
