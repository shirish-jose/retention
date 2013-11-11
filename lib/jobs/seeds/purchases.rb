module Jobs
  module Seeds
    class Purchases < Base

      def initialize
        @file_path = 'db/seeds/mini_proj-items_users.csv'
      end

      # @param [Array<String>] fields
      # @override
      def create_record(fields)
        purchase         = Purchase.new
        purchase.user_id = fields[0]
        purchase.item_id = fields[1]

        # @note(SP): Done to avoid running update_recommendation callback after each purchase.
        purchase.sneaky_save
        purchase
      end
    end
  end
end