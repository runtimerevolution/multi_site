# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    association :site, factory: :site
    login { Faker::Name.name }
  end
end
