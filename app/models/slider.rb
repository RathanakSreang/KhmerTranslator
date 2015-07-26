class Slider < ActiveRecord::Base
  validates :logo, presence: true
  mount_uploader :logo, ImageUploader
  translates :title, :description

  def self.status_show
    where show: true
  end
end
