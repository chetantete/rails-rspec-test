# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Coffee.unique.variety }
    price { 9.99 }
  end
end
