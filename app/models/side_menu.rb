class SideMenu < ActiveRecord::Base
  validates :title, :link, :image, presence: true
  mount_uploader :image, SideImageUploader
end
