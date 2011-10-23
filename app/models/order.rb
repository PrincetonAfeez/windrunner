# == Schema Information
# Schema version: 20111021231652
#
# Table name: orders
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  address    :text
#  receiver   :string(255)
#  email      :string(255)
#  status     :string(255)
#  pay_type   :string(255)
#  creditcard :string(255)
#  created_at :datetime
#  updated_at :datetime
#

######################################################
# LongPH - Oct 21st, 2011
#    create file
######################################################
class Order < ActiveRecord::Base
  # preprocessor
  
  # constants
  PAYMENT_TYPES = [
    # Displayed    stored in db
    [ "Check", "check" ],
    [ "Credit card", "creditc card" ],
    [ "Purchase order", "purchase order" ]
  ]

  # validations
  validates_presence_of :name, :address, :email, :pay_type
  validates_inclusion_of :pay_type, :in =>
    PAYMENT_TYPES.map {|disp, value| value}

  # relations
  has_many :line_items

  # namescopes
  
  
  # methods
  ######################################################
  # -- Output: set of line_item
  # LongPH - Oct 21st, 2011
  #    create
  ######################################################
  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      line_items << li
    end
  end
   

  end
