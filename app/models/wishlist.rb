class WishList < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :wish_list
  has_many :items
end