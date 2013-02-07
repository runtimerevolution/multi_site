class User < ActiveRecord::Base
  has_site_scope

  attr_accessible :name, :site_id
end
