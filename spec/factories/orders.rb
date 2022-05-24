# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    delivery_time { DateTime.current }
    customer { create(:customer) }
    product { create(:product) }
    status { :todo }
  end
end
