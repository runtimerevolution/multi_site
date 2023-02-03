# frozen_string_literal: true

FactoryBot.define do
  sequence :url do |n|
    "url_#{n}"
  end
  factory :site do
    url
  end
end
