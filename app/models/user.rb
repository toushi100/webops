class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :jwt_authenticatable,
          jwt_revocation_strategy: JwtDenylist

  has_many :posts ,dependent: :destroy
  has_one_attached :avatar
  has_many :comments ,dependent: :destroy
end
