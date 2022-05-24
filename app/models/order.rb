# frozen_string_literal: true

# Customer order
class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  validates :customer, presence: true
  validates :delivery_time, presence: true
  validates :product, presence: true
  validates :status, presence: true

  enum status: { todo: 0, delivered: 1 }

  scope :to_prepare, ->(datetime) { where(delivery_time: datetime + 1.hour) }
  scope :by_product, ->(product_id) { where(product_id: product_id) }

  FIRST_DELIVERY_HOUR = 8
  LAST_DELIVERY_HOUR = 19

  def product_name
    Product.first.name
  end
end
