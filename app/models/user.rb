class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Whitelist
  has_many :quizzes, dependent: :destroy

  devise :database_authenticatable, :registerable,
          :recoverable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # Include default devise modules. Others available are:
  # : , :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
end
