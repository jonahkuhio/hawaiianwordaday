class User < ActiveRecord::Base
  validates_presence_of :login
  validates_presence_of :password
  validates_presence_of :email
  validates_confirmation_of :email
  validates_uniqueness_of :login
  validates_uniqueness_of :email
  
  has_many :words
  
  def password=(value)
    value = Digest::SHA1.hexdigest(value) if value
    write_attribute(:password, value)
  end

  def self.authenticate(login,password)
    find(:first, :conditions => ["login = ? and password = ?", login, Digest::SHA1.hexdigest(password)])
  end
end
