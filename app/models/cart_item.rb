######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class CartItem
  
  attr_reader :product, :quantity
  
  ######################################################
  # -- Output: created product
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def initialize(product)
    @product = product
    @quantity = 1
  end
  
  ######################################################
  # -- Output: increase quantity by 1
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def increment_quantity
    @quantity += 1
  end
  
  ######################################################
  # -- Output: name of product
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def name
    @product.name
  end
  
  ######################################################
  # -- Output: cost of product
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def cost
    @product.cost
  end
  
  ######################################################
  # -- Output: cost of a product
  # -- Type: 1 for normal, 2 for sale-off, 3 for member
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def price(type)
    if type == 1
      cost = @product.price * @quantity / $exchange_rate
    elsif type == 2
      cost = @product.special_price * @quantity / $exchange_rate
    elsif type == 3
      cost = @product.member_price * @quantity / $exchange_rate
    end
    @product.cost = cost
    @product.save
    cost
  end
  
end