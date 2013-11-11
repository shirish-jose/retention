class User < ActiveRecord::Base
  attr_accessible :name

  has_many :purchases
  has_many :items, through: :purchases

  validates :name, presence: true
end
