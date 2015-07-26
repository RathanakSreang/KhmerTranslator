class Page < ActiveRecord::Base
  extend FriendlyId  
  has_ancestry  
  validates :name, :title, :content, presence: true
  friendly_id :title, use: :slugged
  translates :name, :title, :content
  def self.status_show
    where show: true
  end
end
