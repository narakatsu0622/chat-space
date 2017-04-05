class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, through: :group_users
  has_many :group_users

  scope :other_users, ->(current_user) { where.not(id: current_user.id) }
  mount_uploader :image, ImageUploader
end
