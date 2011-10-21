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
