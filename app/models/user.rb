class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :children
  has_many :notifications

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.uid
      user.email    = auth.info.email
      user.name     = auth.info.name
      user.facebook = auth.info.urls.Facebook
      user.password = Devise.friendly_token[0,20]
      user.remote_avatar_url   = auth.info.image
      user.skip_confirmation!  # 如果 devise 有使用 confirmable，記得 skip！
    end
end
end
  
