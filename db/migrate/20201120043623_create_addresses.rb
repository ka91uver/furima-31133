class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :post_code,       null: false
      t.integer     :ship_from_id,   null: false
      t.string      :city,            null: false
      t.string      :house_number,    null: false
      t.string      :building_name,   null: false
      t.string      :phone_number,    null: false , unique: true
      t.references  :purchase,        foreign_key: true
      t.timestamps
    end
  end
end
