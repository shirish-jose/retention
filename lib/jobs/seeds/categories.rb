module Jobs
  module Seeds
    class Categories < Base

      def initialize
        @file_path = 'db/seeds/mini_proj-categories.csv'
      end

      # @param [Array<String>] fields
      # @override
      def create_record(fields)
        category      = Category.new
        category.id   = fields[0]
        category.name = fields[1]
        category.save
        category
      end
    end
  end
end