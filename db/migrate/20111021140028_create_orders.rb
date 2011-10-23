class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :receiver
      t.string :email
      t.string :status, :default => "Active"
      t.string :pay_type
      t.string :creditcard
      t.number :user_id
      t.number :cart_id

      t.timestamps
    end
      
    # add some indexes
      add_index :orders, [:name, :email, :pay_type]
    
  end

  def self.down
    drop_table :orders
  end
end
