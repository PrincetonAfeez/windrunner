######################################################
# LongPH - Oct 22nd, 2011
#    create file
######################################################
class InfoController < ApplicationController
  
  ######################################################
  # -- Output: redirect to product-buyers page
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def who_bought
    @product = Product.find(params[:id])
    @orders = @product.orders
    respond_to do |format|
      
      # use html view
      format.html
      
      # use atom builder
      #format.atom { render :layout => false }
      
      # use json
      #format.json { render :layout => false ,
      #  :json => @product.to_json(:include => :orders) }

    end
  end

  protected
  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def authorize
  
  end
end
