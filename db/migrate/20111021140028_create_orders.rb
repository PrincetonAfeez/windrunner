class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :receiver
      t.string :email
      t.string :status
      t.string :pay_type
      t.string :creditcard
      t.number :user_id
      t.number :cart_id

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
