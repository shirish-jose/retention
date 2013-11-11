module Jobs
  module Seeds
    class Users < Base

      def initialize
        @file_path = 'db/seeds/mini_proj-users.csv'
      end

      # @param [Array<String>] fields
      # @override
      def create_record(fields)
        user      = User.new
        user.id   = fields[0]
        user.name = fields[1]
        user.save
        user
      end
    end
  end
end