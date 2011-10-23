# == Schema Information
# Schema version: 20111021231652
#
# Table name: line_items
#
#  id          :integer(4)      not null, primary key
#  product_id  :integer(4)      not null
#  order_id    :integer(4)      not null
#  quantity    :integer(4)      not null
#  total_price :decimal(8, 2)   not null
#  created_at  :datetime
#  updated_at  :datetime
#

######################################################
# LongPH - Oct 21st, 2011
#    create file
######################################################
class LineItem < ActiveRecord::Base
  # preprocessor
  
  # validations

  # relations
  belongs_to :order
  belongs_to :product

  # namescopes
  
  # methods
  ######################################################
  # -- Output: add a line_item from cart_item
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def self.from_cart_item(cart_item)
    li = self.new
    li.product = cart_item.product
    li.quantity = cart_item.quantity
    li.total_price = cart_item.cost
    li
  end

end
