class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  def self.find_for_oauth(auth)
    
    puts auth.except("extra")
    
    user = User.where(uid: auth.info.name, provider: auth.provider, email: "#{auth.uid}-#{auth.provider}@example.com").first
    
    if user != nil then
      user.update(uid: auth.info.name, icon: auth.info.image, bio: auth.info.description)
    end

    unless user
      user = User.create(
        uid:      auth.info.name,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        icon: auth.info.image,
        bio: auth.info.description
     )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
