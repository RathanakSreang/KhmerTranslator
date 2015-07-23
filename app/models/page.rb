class Page < ActiveRecord::Base
  has_ancestry
  validates :name, :content, presence: true
end
