######################################################
# LongPH - Oct 22nd, 2011
#    create file
######################################################
class OrdersController < ApplicationController
  # use active_scaffold
  active_scaffold :orders do |conf|
    conf.list.label = 'All Orders:'
    conf.list.sorting = [{:name => :ASC}, {:receiver => :ASC}, {:created_at => :ASC}]
    conf.columns = [:name, :receiver, :email, :status, :pay_type, :credit_card,
      :line_items, :created_at, :updated_at
    ]
  end
  
  # preprocessor
  layout "application"
    
#  ######################################################
#  # GET /orders
#  # GET /orders.xml
#  # -- Output: redirect to order page
#  # LongPH - Oct 22nd, 2011
#  #    create
#  ######################################################
#  def index
#    @orders = Order.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @orders }
#    end
#  end
#
#  ######################################################
#  # GET /orders/1
#  # GET /orders/1.xml
#  # LongPH - Oct 22nd, 2011
#  #    create
#  ######################################################
#  def show
#    @order = Order.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @order }
#    end
#  end
#
#  ######################################################
#  # GET /orders/new
#  # GET /orders/new.xml
#  # LongPH - Oct 22nd, 2011
#  #    create
#  ######################################################
#  def new
#    @order = Order.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @order }
#    end
#  end
#
#  ######################################################
#  # GET /orders/1/edit
#  # LongPH - Oct 22nd, 2011
#  #    create
#  ######################################################
#  def edit
#    @order = Order.find(params[:id])
#  end
#
#  ######################################################
#  # POST /orders
#  # POST /orders.xml
#  # LongPH - Oct 22nd, 2011
#  #    create
#  ######################################################
#  def create
#    @order = Order.new(params[:order])
#
#    respond_to do |format|
#      if @order.save
#        flash[:notice] = 'Order was successfully created.'
#        format.html { redirect_to(@order) }
#        format.xml  { render :xml => @order, :status => :created, :location => @order }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  ######################################################
#  # PUT /orders/1
#  # PUT /orders/1.xml
#  # LongPH - Oct 22nd, 2011
#  #    create
#  ######################################################
#  def update
#    @order = Order.find(params[:id])
#
#    respond_to do |format|
#      if @order.update_attributes(params[:order])
#        flash[:notice] = 'Order was successfully updated.'
#        format.html { redirect_to(@order) }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
#
#  ######################################################
#  # DELETE /orders/1
#  # DELETE /orders/1.xml
#  # LongPH - Oct 22nd, 2011
#  #    create
#  ######################################################
#  def destroy
#    @order = Order.find(params[:id])
#    @order.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(orders_url) }
#      format.xml  { head :ok }
#    end
#  end
end
