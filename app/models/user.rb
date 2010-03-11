require 'digest/sha1'

class User < ActiveRecord::Base
  has_many    :fields
  belongs_to  :role
  belongs_to  :level
  belongs_to  :certification
  belongs_to  :age
  belongs_to  :club
  validates_length_of       :username, :within => 3..40
  validates_length_of       :password, :within => 5..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_presence_of     :username, :email, :salt
  validates_uniqueness_of   :username, :email
  validates_format_of       :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  
  attr_protected :id, :salt
  
  attr_accessor :password, :password_confirmation
  
  def self.authenticate(username, pass)
    u = find(:first, :conditions => ["username = ?", username])
    return nil if u.nil?
    if User.encrypt(pass, u.salt) == u.hashed_password
      return u
    end
    nil
  end
  
  def password=(password)
    @password = password
    self.salt = User.random_string(10) if !self.salt?
    self.hashed_password = User.encrypt(@password, self.salt)
  end
  
  def send_new_password
    new_pass = User.random_string(10)
    self.password = self.password_confirmation = new_pass
    self.save
    # Notifications.deliver_forgot_password(self.email, self.login, new_pass)
  end
  
  def referee?
    if self.role.name =~ /referee/i
      return true
    end
    false
  end
  
  def assignor?
    if self.role.name =~ /assignor/i
      return true
    end
    false
  end
  
  protected
  
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest(password+salt)
  end
  
  def self.random_string(length)
    # generate a random pssword
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(length) { |i| newpass << chars[rand(chars.size-1)]}
    return newpass
  end
  
  def password_required?
    hashed_password.nil? || !password.blank?
  end
  
end