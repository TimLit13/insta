class User < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
         
  validates :name, presence: true, length: {maximum: 50}

  def self.from_omniauth(auth)
    puts auth.info.email
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      # user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
    new(session["devise.user_attributes"]) do |user|
      user.attributes = params
      user.valid?
    end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  private

  def adjust_email
    self.email = "fake+#{generate_token}" if email.blank?
    true
  end

  def generate_token
    rand(36**8).to_s(36).concat(“@gmail.com”)
  end

end