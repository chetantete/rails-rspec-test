# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Orders" do
  let(:datetime) { (DateTime.current + 1.day).change(hour: 10) }
  let(:date) { datetime.to_date }
  let(:product) { create(:product) }
  let(:order) { create(:order, delivery_time: datetime, product: product) }

  describe "#index" do
    context "with orders" do
      it "lists the orders" do
        order
        visit orders_path(date: date)
        expect(page).to have_content(product.name)
      end
    end

    context "with no orders" do
      it "shows the no order message" do
        visit orders_path(date: date)
        expect(page).to have_content("No orders for this day")
      end
    end
  end

  describe "#show" do
    context "with an order" do
      it "shows the order" do
        visit order_path(order)
        expect(page).to have_content("Delivery time: #{datetime.utc}")
        expect(page).to have_content("Status: todo")
        expect(page).to have_content("Product: #{product.name}")
      end
    end
  end
end
