module Services
  class Recommend < Struct.new(:user_id)

    # @return [Array<Fixnum>]
    def category_ids
      @category_ids ||= Category.select(:id).group(:id).joins(:items).where(items: {id: purchased_item_ids}).map(&:id)
    end

    def perform!
      Recommendation.where(user_id: user_id).delete_all
      recommended_items.each do |item|
        Recommendation.create(user_id: user_id, item_id: item.id, weight: (item.category_ids & category_ids).count)
      end
    end

    # @return [Array<Fixnum>]
    def purchased_item_ids
      @purchased_item_ids ||= Purchase.select('DISTINCT purchases.item_id').where(user_id: user_id).map(&:item_id)
    end

    # @return [Array<Item>]
    def recommended_items
      @recommended_items ||= begin
        Item.where(:id.not_in => purchased_item_ids).
             joins(:categories).
             where(categories: { id: category_ids }).
             preload(:categories).
             to_a
      end
    end
  end
end