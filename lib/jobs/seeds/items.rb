module Jobs
  module Seeds
    class Items < Base

      def initialize
        @file_path = 'db/seeds/mini_proj-items.csv'
      end

      # @param [Array<String>] fields
      # @override
      def create_record(fields)
        item = Item.new
        item.id   = fields[0]
        item.name = fields[1]
        item.save
        item
      end
    end
  end
end