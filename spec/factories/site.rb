require 'factory_girl'

FactoryGirl.define do
  sequence :url do |n|
    "url_#{n}"
  end
  factory :site do
    url
  end
end