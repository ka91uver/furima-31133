class CreatePurchaseAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_adresses do |t|

      t.timestamps
    end
  end
end
