class User < ApplicationRecord
  has_many :quizzes, dependent: :destroy

  # devise :database_authenticatable, :registerable,
  #         :recoverable, :validatable,
  #        :jwt_authenticatable, jwt_revocation_strategy: self

  devise :database_authenticatable, :registerable,
  :recoverable, :validatable

  has_many :access_grants,
            class_name: 'Doorkeeper::AccessGrant',
            foreign_key: :resource_owner_id,
            dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
            class_name: 'Doorkeeper::AccessToken',
            foreign_key: :resource_owner_id,
            dependent: :delete_all # or :destroy if you need callbacks

  # Include default devise modules. Others available are:
  # : , :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
end
