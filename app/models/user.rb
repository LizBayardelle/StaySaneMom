class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one_attached :avatar
  include Spree::UserMethods

  # Relations
  has_many :blogs
  has_many :tasks
  has_many :comments, dependent: :destroy
  has_many :people
  has_many :occasions
end
