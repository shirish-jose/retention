class Purchase < ActiveRecord::Base
  attr_accessible :item_id, :user_id

  belongs_to :item
  belongs_to :user

  validates :item_id, :user, presence: true

  after_save :update_user_recommendation


  private

  # @return [true]
  def update_user_recommendation
    Services::Recommend.new(user_id).perform!
    true
  end
end
