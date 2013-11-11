class AddCategoriesItems < ActiveRecord::Migration

  def change
    create_table :categories_items do |t|
      t.integer :category_id
      t.integer :item_id
    end
  end
end
