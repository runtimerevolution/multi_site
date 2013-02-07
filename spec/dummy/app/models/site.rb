class Site < ActiveRecord::Base

  validates :url, :presence => true, :uniqueness => true
  attr_accessible :url
end
