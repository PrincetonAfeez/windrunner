######################################################
# LongPH - Oct 22nd, 2011
#    create file
######################################################
class User < ActiveRecord::Base
  # preprocessor
  attr_accessor :password
  attr_accessor :password_confirmation
  
  # validations
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_confirmation_of :password
  validate :password_non_blank

  # relations

  # namescopes
  
  # methods
  
  ######################################################
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
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  

  ######################################################
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

  private
  ######################################################
  # LongPH - Oct 22nd, 2011
  #    create
  ######################################################
  def password_non_blank
    errors.add(:password, "Missing password" ) if hashed_password.blank?
  end

  
end