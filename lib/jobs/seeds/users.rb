module Jobs
  module Seeds
    class Users < Base

      def initialize
        @file_path = 'db/seeds/mini_proj-users.csv'
      end

      # @param [Array<String>] fields
      # @overrides
      def create_record(fields)
        User.create!(id: fields[0], name: fields[1])
      end
    end
  end
end