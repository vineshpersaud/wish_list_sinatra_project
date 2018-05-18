class WishList < ActiveRecord::Base
  belongs_to :wish_list
  has_many :items
end