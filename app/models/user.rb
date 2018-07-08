class User < ApplicationRecord
  has_many :soom_cards
  has_many :written_cards, class_name: :SoomCard
  has_many :recieved_cards, class_name: :SoomCard

  has_many :follower_follows, class_name: 'Follow', foreign_key: :followee_id
  has_many :followers, through: :follower_follows, source: :follower
  has_many :followee_follows, class_name: 'Follow', foreign_key: :follower_id
  has_many :followees, through: :followee_follows, source: :followee

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
