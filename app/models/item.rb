class Item < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :categories

  validates :name, presence: true
end
