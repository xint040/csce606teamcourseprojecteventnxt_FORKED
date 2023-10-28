class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         
         
         # <!--===================-->
         # <!--to add google authentication-->
         :omniauthable, omniauth_providers: [:google_oauth2]
         # <!--===================-->
  has_many :events
         
  
  
  # <!--===================-->
  # <!--to use google user info to create an account-->
  def self.from_google(info)
    create_with(uid: info[:uid], provider: 'google',
                password: Devise.friendly_token[0, 20]).find_or_create_by!(email: info[:email])
  end
  # <!--===================-->
end
