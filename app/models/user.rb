class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username,uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def email_required?
  	false
  end

  def e_mailchanged?
  	false
  end

  has_many :books

  attachment :profile_image

  validates :username,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 2, maximum: 20 }

  validates :Introduction,
  length:{ maximum: 50 }
end
