class Recommendation < ActiveRecord::Base
  attr_accessible :item_id, :user_id, :weight

  belongs_to :item, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :user_id, :item_id, :weight, presence: true
end
