module Jobs
  module Seeds
    class AddItemCategories < Base

      def initialize
        @file_path = 'db/seeds/mini_proj-categories_items.csv'
      end

      # @param [Array<String>] fields
      # @override
      def create_record(fields)
        item     = Item.find_by_id(fields[0])
        category = Category.find_by_id(fields[1])
        item.categories << category if item && category
      end
    end
  end
end