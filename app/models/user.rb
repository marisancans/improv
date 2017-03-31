class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :events, :dependent => :destroy 
  has_many :lists, :dependent => :destroy 
  has_many :subscribed_feeds, dependent: :destroy
  has_many :galleries
  has_many :messages
  has_many :chatrooms, through: :messages
end
