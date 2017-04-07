class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates_presence_of :body, if: "image.blank?"
  mount_uploader :image, ImageUploader
end
