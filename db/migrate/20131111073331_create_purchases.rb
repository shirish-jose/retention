class CreatePurchases < ActiveRecord::Migration

  def change
    create_table :purchases do |t|
      t.integer :item_id
      t.integer :user_id
    end
  end
end
