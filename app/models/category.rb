# == Schema Information
# Schema version: 20111024084821
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  parent_id   :integer(4)
#  status      :string(255)     default("Active")
#  created_at  :datetime
#  updated_at  :datetime
#


######################################################
# LongPH - Oct 23rd, 2011
#    create file
######################################################
class Category < ActiveRecord::Base
  # preprocessor
  #category :order => "name"

  # validations
  validates_presence_of :name
  # validates_uniqueness_of :name
  
  # relations
  belongs_to :parent, :class_name => "Category"
  has_many :children, :class_name => "Category",
                      :foreign_key => "parent_id",
                      :order => "id",
                      :dependent => :destroy
  has_many :products
  
  # namescopes
  
  # methods
   
  ######################################################
  # LongPH - Oct 20th, 2011
  #    create
  ######################################################

end
