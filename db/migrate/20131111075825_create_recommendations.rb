class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :weight, null: false, default: 1
    end
  end
end
