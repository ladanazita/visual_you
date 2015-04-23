class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  mount_uploader :picture, PictureUploader
end
