######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class StoreController < ApplicationController
  # preprocessor
  skip_before_filter :authorize, :only => [:index, :add_to_cart, :empty_cart, :checkout]
  before_filter :find_cart, :except => :empty_cart
  
  ######################################################
  # -- Output: all sale-off products
  # LongPH - Oct 20th, 2011
  #    create
  # LongPH - Oct 24th, 2011
  #    change to sale-off products
  ######################################################
  def index
    #@category = Category.find(:all, :conditions => {:status => "Active"})
    @products = Product.find_products_for_sale_off
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
    @current_item.price(2)
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
    #flash[:notice] = "Your cart is currently empty"
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
      # empty the cart
      session[:cart] = nil
      # send a confirmation email
      email = OrderMailer.create_sent(@order)
      email.set_content_type("text/html" )
      OrderMailer.deliver(email)
    
      redirect_to_index (I18n.t('msg.order_successful'))
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
