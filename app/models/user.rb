class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one_attached :avatar

  # Relations
  has_many :blogs
  has_many :tasks
  has_many :comments, dependent: :destroy
  has_many :people
  has_many :occasions
  has_many :capsules
  has_many :capsule_items
  has_many :meals
  has_many :purchases

  def full_name
    "#{first_name} #{last_name}"
  end
end
