module Jobs
  module Seeds
    class Items < Base

      def initialize
        @file_path = 'db/seeds/mini_proj-items.csv'
      end

      # @param [Array<String>] fields
      # @override
      def create_record(fields)
        Item.create!(id: fields[0], name: fields[1])
      end
    end
  end
end