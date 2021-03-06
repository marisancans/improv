class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  has_many :events, :dependent => :destroy 
  has_many :lists, :dependent => :destroy 
  has_many :subscribed_feeds, dependent: :destroy
  has_many :galleries
  has_many :user_keys
  has_many :locations
  has_many :messages
  has_many :chatrooms, through: :messages
  
  has_secure_token :location_token
  
  mount_uploader :profile_image, ProfileImageUploader
  
  validate :validate_username
  
  attr_accessor :login
  
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
    
end
