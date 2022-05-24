# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :orders, dependent: :restrict_with_error

  validates :name, presence: true
  validates :price, numericality: true, presence: true
end
