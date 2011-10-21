######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class Cart
  attr_reader :items
  
  ######################################################
  # -- Output: blank cart
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def initialize
    @items = []
  end
  
  ######################################################
  # -- Output: list of cart items
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def add_product(product)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      @items << CartItem.new(product)
    end
  end
  
  ######################################################
  # -- Output: total price of cart
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def total_price
    @items.sum {|item| item.cost}
  end
  
end