require 'digest/sha1'

class User < ActiveRecord::Base
  has_many    :fields
  has_many    :bids
  has_many    :assignments
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
  validates_presence_of     :club_id
  validates_format_of       :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  # valid games for the user
  has_many :eligible_games, :through => :age, :source => :games
  
  attr_protected :id, :salt
  attr_accessor :password, :password_confirmation

  # authentication methods
  
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
    if !@password.blank?
      self.salt = User.random_string(10) if !self.salt?
      self.hashed_password = User.encrypt(@password, self.salt)
    end
  end
  
  def send_new_password
    new_pass = User.random_string(10)
    self.password = self.password_confirmation = new_pass
    self.save
    # Notifications.deliver_forgot_password(self.email, self.login, new_pass)
  end

  def home_page
    # FIXME - set up the home page properly and more pragmatically
    if self.referee?
      return "/bids"
    end
    if self.assignor?
      return "/assignors"
    end
    if self.clubadmin?
      return "some/admin/page"
    end
  end
  
  def clubadmin?
    if self.role.name.downcase == "admin"
      return true
    end
    false
  end
  
  def referee?
    if self.role.name.downcase == "referee"
      return true
    end
    false
  end
  
  def assignor?
    if self.role.name.downcase == "assignor"
      return true
    end
    false
  end

  def can_edit_user(user)
    if self.club_id == user.club_id or self.role.name.downcase == 'master' then
      return true
    else
      return false
    end
  end
  
  ############# protected methods ################
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