class Site < ActiveRecord::Base
  has_many :users

  validates :url, presence: true, uniqueness: true
end
