class Slider < ActiveRecord::Base
  validates :logo, presence: true
  mount_uploader :logo, ImageUploader
end
