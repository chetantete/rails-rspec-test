# frozen_string_literal: true

class ChangeDeliveryDateToDeliveryTime < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up { remove_column(:orders, :delivery_date) }
      dir.down { remove_column(:orders, :delivery_date, :date) }
    end

    change_table :orders do |t|
      t.datetime :delivery_time
    end
  end
end
