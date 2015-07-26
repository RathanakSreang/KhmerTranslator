class SideMenu < ActiveRecord::Base
  validates :title, :link, :image, presence: true
  mount_uploader :image, SideImageUploader
  translates :title

  def self.status_show
    where show: true
  end
end
