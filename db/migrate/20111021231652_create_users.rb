class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.string :salt
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :membership, :default => "Normal"
      t.string :status, :default => "Active"
      t.string :sex, :default => "Male"
      t.string :filename

      t.timestamps
    end
    
      # add some indexes
      add_index :users, [:username, :status, :membership]
      
      # insert some samples
      User.create(:username => "phuongdtl", :first_name => "Phuong", :last_name => "Dang-Thi-Lan", :sex => "Female",
        :address => "District 3", :city => "HCMC", :country => "Vietnam", :membership => "VIP", :password => "123456")
      User.create(:username => "longph", :first_name => "Long", :last_name => "Phan-Hoang",
        :address => "Hocmon", :city => "HCMC", :country => "Vietnam", :membership => "Admin", :password => "123456")
      User.create(:username => "thita", :first_name => "Thi", :last_name => "Tran-Anh",
        :address => "Hocmon", :city => "HCMC", :country => "Vietnam", :membership => "VIP", :password => "123456")
      User.create(:username => "tamttt", :first_name => "Tam", :last_name => "Tran-Thi-Thanh", :sex => "Female",
        :address => "Hocmon", :city => "HCMC", :country => "Vietnam", :membership => "VIP", :password => "123456")
      User.create(:username => "thonghq", :first_name => "Thong", :last_name => "Huynh-Quoc",
        :address => "Hocmon", :city => "HCMC", :country => "Vietnam", :membership => "Normal", :password => "123456")
      User.create(:username => "huypa", :first_name => "Huy", :last_name => "Phan-Anh",
        :address => "Hocmon", :city => "HCMC", :country => "Vietnam", :membership => "Member", :password => "123456")
      User.create(:username => "nhanlt", :first_name => "Nhan", :last_name => "Luu-Trong",
        :address => "Hocmon", :city => "HCMC", :country => "Vietnam", :membership => "Member", :password => "123456")
      User.create(:username => "maits", :first_name => "Mai", :last_name => "Tran-Suong", :sex => "Female",
        :address => "Hocmon", :city => "HCMC", :country => "Vietnam", :membership => "Normal", :password => "123456")
      
  end

  def self.down
    drop_table :users
  end
end
