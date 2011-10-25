# == Schema Information
# Schema version: 20111024084821
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  username        :string(255)
#  hashed_password :string(255)
#  salt            :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  address         :text
#  city            :string(255)
#  state           :string(255)
#  country         :string(255)
#  membership      :string(255)     default("Normal")
#  status          :string(255)     default("Active")
#  created_at      :datetime
#  updated_at      :datetime
#

######################################################
# LongPH - Oct 22nd, 2011
#    create file
######################################################
class User < ActiveRecord::Base
  # preprocessor
  SEX = %w(Male Female)
  STATUS = %w(Active Banned Deleted Pending)
  
  # attributes
  #file_column :filename
  attr_accessor :password
  attr_accessor :password_confirmation
  
  # validations
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_confirmation_of :password
  validate :password_non_blank
  validates_inclusion_of :sex, :in => SEX
  
  # relations

  # namescopes
  
  # methods
  
  ######################################################
  # -- Output: new salt
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  ######################################################
  # -- Output: virtual password
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def password
    @password
  end

  ######################################################
  # -- Output: full name of a user
  # LongPH - Oct 23rd, 2011
  #    create
  ######################################################
  def full_name
    self.first_name + " " + self.last_name
  end

  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def self.authenticate(name, password)
    user = self.find_by_username(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  

  ######################################################
  # -- Output: sencrypted password
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def self.hashed_password(password)
    Digest::SHA1.hexdigest(password)
  end

  ######################################################
  # -- Output: raise an error and cause database auto rollback
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

  private
  ######################################################
  # -- Output: validate blank password
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def password_non_blank
    errors.add(:password, "Missing password" ) if hashed_password.blank?
  end

  
end
