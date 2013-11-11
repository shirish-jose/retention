class User < ActiveRecord::Base
  attr_accessible :name

  has_many :purchases
  has_many :items, through: :purchases

  has_many :recommendations
  has_many :recommended_items, through:    :recommendations,
                               class_name: 'Item',
                               source:     :item,
                               order:      'recommendations.weight DESC'

  validates :name, presence: true
end
