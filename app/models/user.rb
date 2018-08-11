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
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.find_for_facebook_oauth(auth)
    puts "----------------------1111111111111"
    puts auth.info
    puts auth.info.email
    puts auth.info.name
    puts auth.credentials.token
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      # user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.token = auth.credentials.token
      user.save
    end
    # 이 때는 이상하게도 after_create 콜백이 호출되지 않아서 아래와 같은 조치를 했다.
    # user.add_role :user if user.roles.empty?
    # 최종 반환값은 user 객체이어야 한다.
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  # def after_sign_in_path_for
  #   auth = request.env['omniauth.auth']
  #   @user = User.find(current_user.id)
  #   if @user.persisted?
  #     soom_card_path
  #   else
      


 end
