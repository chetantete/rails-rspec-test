# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Slots" do
  let(:datetime) { (DateTime.current + 1.day).change(hour: 11) }
  let(:date) { datetime.to_date.beginning_of_week }
  let(:product) { create(:product) }
  let(:order) { create(:order, delivery_time: datetime, product: product) }

  describe "#index" do
    context "with orders" do
      it "lists the products by slot" do
        order
        visit slots_path(date: date)
        expect(page).to have_content("#{product.name} 1")
      end
    end
  end
end
