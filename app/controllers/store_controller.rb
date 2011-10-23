######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class StoreController < ApplicationController
  # preprocessor
  skip_before_filter :authorize, :only => [:index, :add_to_cart, :empty_cart]
  before_filter :find_cart, :except => :empty_cart
  
  ######################################################
  # -- Output: all valid products to be sold
  # LongPH - Oct 20th, 2011
  #    create
  ######################################################
  def index
    #@category = Category.find(:all, :conditions => {:status => "Active"})
    @products = Product.find_products_for_sale
  end

  ######################################################
  # -- Output: cart saved in sessions
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def find_cart
    @cart = (session[:cart] ||= Cart.new)
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
  
  ######################################################
  # -- Output: redirect to checkout page
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index("Your cart is empty" )
    else
      @order = Order.new
    end
  end

  
  ######################################################
  # -- Output: redirect to successful order page
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to_index("Thank you for your order" )
    else
      render :action => 'checkout'
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
