class Page < ActiveRecord::Base
  has_ancestry
  validates :name, :title, :content, presence: true
end
