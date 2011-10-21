######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class StoreController < ApplicationController
  # preprocessor
  
  ######################################################
  # -- Output: all valid products to be sold
  # LongPH - Oct 20th, 2011
  #    create
  ######################################################
  def index
    @products = Product.find_products_for_sale
    @cart = find_cart
  end

  ######################################################
  # -- Output: cart saved in sessions
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def find_cart
    session[:cart] ||= Cart.new
  end
  
  ######################################################
  # -- Output: cart saved in sessions
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @current_item = @cart.add_product(product)
    @current_item.price(1)
    respond_to do |format|
      format.js if request.xhr?
      format.html {redirect_to_index}
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end
  
  ######################################################
  # -- Output: empty cart in session
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def empty_cart
    session[:cart] = nil
    #redirect_to_index("Your cart is currently empty")
    flash[:notice] = "Your cart is currently empty"
    respond_to do |format|
      format.js
    end
  end
  
  private
  ######################################################
  # -- Output: redirect to index page
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def redirect_to_index(msg = nil)
    flash[:notice] = msg if msg
    redirect_to :action => 'index'
  end
  
end
