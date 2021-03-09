class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal_code,        null: false
      t.integer :prefecture_id,     null: false
      t.string :municipality,       null: false
      t.string :address,            null: false
      t.string :building                      
      t.string :tel_num,            null: false
      t.references :order_history,  foreign_key: true
      t.timestamps
    end
  end
end