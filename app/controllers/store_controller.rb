######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class StoreController < ApplicationController
  # preprocessor
  
  ######################################################
  # LongPH - Oct 20th, 2011
  #    create
  ######################################################
  def index
    @products = Product.find_products_for_sale
  end

end
