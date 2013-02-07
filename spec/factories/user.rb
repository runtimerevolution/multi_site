require 'factory_girl'

FactoryGirl.define do
  factory :user do
    association :site, :factory => :site
    name Faker::Name.name
  end
end