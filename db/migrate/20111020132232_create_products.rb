######################################################
# LongPH - Oct 20th, 2011
#    create file
######################################################
class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name, :unique
      t.text :description
      t.string :image_url, :default => "No image"
      t.float :cost, :default => 0.0
      t.float :price, :default => 0.0
      t.float :special_price, :default => 0.0
      t.float :member_price, :default => 0.0
      t.string :status, :default => "Active"
      t.integer :quantity, :default => 0
      t.integer :category_id, :null => false, :options =>
        "CONSTRAINT fk_category REFERENCES categories(id)"
      t.timestamps
    end

    # add some indexes
    add_index :products, [:name, :status]
    
  end

  def self.down
    drop_table :products
  end
end
