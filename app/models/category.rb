######################################################
# LongPH - Oct 23rd, 2011
#    create file
######################################################
class Category < ActiveRecord::Base
  # preprocessor
  #category :order => "name"

  # validations
  validates_presence_of :name
  validates_uniqueness_of :name
  
  # relations
  belongs_to :parent, :class_name => "Category"
  has_many :children, :class_name => "Category",
                      :foreign_key => "parent_id",
                      :order => "name",
                      :dependent => :destroy
  has_many :products
  
  # namescopes
  
  # methods
   
  ######################################################
  # LongPH - Oct 20th, 2011
  #    create
  ######################################################

end
