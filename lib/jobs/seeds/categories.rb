module Jobs
  module Seeds
    class Categories < Base

      def initialize
        @file_path = 'db/seeds/mini_proj-categories.csv'
      end

      # @param [Array<String>] fields
      # @override
      def create_record(fields)
        Category.create!(id: fields[0], name: fields[1])
      end
    end
  end
end