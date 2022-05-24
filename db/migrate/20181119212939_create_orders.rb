# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :delivery_date
      t.integer :status, default: 0
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
