######################################################
# LongPH - Oct 23rd, 2011
#    create file
######################################################
class CategoriesController < ApplicationController
	# preprocessor
	skip_before_filter :authorize, :only => [:index, :index_sub, :add_to_cart, :empty_cart]
	before_filter :find_cart, :except => :empty_cart
	
	helper :all # include all helpers, all the time
	# GET /categories
	# GET /categories.xml
	######################################################
	# -- Output: return the main categories
	# LongPH - Oct 23rd, 2011
	#    create
	######################################################
	def index
		if session[:membership] && session[:membership] == "Admin"
			@categories = Category.find(:all, :conditions => {:parent_id => nil},
					:include => [ { :children => [ :children, :parent ] }, :parent ])
		else
			@categories = Category.find(:all, :conditions => {:parent_id => nil},
					:include => [ { :children => [ :children, :parent ] }, :parent ])
		end
		#@products = Product.find_products_for_sale
		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @categories }
		end
	end

	######################################################
	# -- Output: return the main categories
	# LongPH - Oct 23rd, 2011
	#    create
	######################################################
	def index_sub
		category = Category.find_by_id(params[:id])
		if category.children.empty? || category.nil?
		@products = Product.find_products_for_sale
		else
			@categories = category.children
		end
		respond_to do |format|
			format.html # index_sub.html.erb
			format.xml  { render :xml => @categories }
		end
	end

	######################################################
	# GET /categories/1
	# GET /categories/1.xml
	# LongPH - Oct 23rd, 2011
	#    create
	######################################################
	def show
		@category = Category.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml => @category }
		end
	end

	######################################################
	# GET /categories/new
	# GET /categories/new.xml
	# LongPH - Oct 23rd, 2011
	#    create
	######################################################
	def new
		@category = Category.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml  { render :xml => @category }
		end
	end

	######################################################
	# GET /categories/1/edit
	# LongPH - Oct 23rd, 2011
	#    create
	######################################################
	def edit
		@category = Category.find(params[:id])
	end

	######################################################
	# POST /categories
	# POST /categories.xml
	# LongPH - Oct 23rd, 2011
	#    create
	######################################################
	def create
		@category = Category.new(params[:category])

		respond_to do |format|
			if @category.save
				flash[:notice] = 'Category was successfully created.'
				format.html { redirect_to(@category) }
				format.xml  { render :xml => @category, :status => :created, :location => @category }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
			end
		end
	end

	######################################################
	# PUT /categories/1
	# PUT /categories/1.xml
	# LongPH - Oct 23rd, 2011
	#    create
	######################################################
	def update
		@category = Category.find(params[:id])

		respond_to do |format|
			if @category.update_attributes(params[:category])
				flash[:notice] = 'Category was successfully updated.'
				format.html { redirect_to(@category) }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
			end
		end
	end

	######################################################
	# DELETE /categories/1
	# DELETE /categories/1.xml
	# LongPH - Oct 23rd, 2011
	#    create
	######################################################
	def destroy
		@category = Category.find(params[:id])
		@category.status = "Deleted"
		@category.save

		respond_to do |format|
			format.html { redirect_to(categories_url) }
			format.xml  { head :ok }
		end
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
	# -- Output: add product to cart in session
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
		#render :controller => :store, :action => "add_to_cart.js.rjs"
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
