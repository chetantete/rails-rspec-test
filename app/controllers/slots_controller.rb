# frozen_string_literal: true

# Controller for viewing slots
class SlotsController < ApplicationController
  def index
    set_date
    set_orders
  end

  private

  def set_date
    @date = if params[:date]
              Date.parse(params[:date]).beginning_of_week
            else
              Date.current.beginning_of_week
            end
  end

  def set_orders
    @data = {}

    [*@date.beginning_of_week..@date.end_of_week].each do |date|
      [*Order::FIRST_DELIVERY_HOUR..Order::LAST_DELIVERY_HOUR].each do |hour|
        @data[date] = {} if @data[date].nil?
        @data[date][hour] = {} if @data[date][hour].nil?

        orders = Order
          .joins(:product)
          .includes(:product)
          .where('orders.delivery_time': date.to_datetime.change(hour: hour))

        orders.each do |order|
          if @data[date][hour][order.product.name].nil?
            @data[date][hour][order.product.name] = 1
          else
            @data[date][hour][order.product.name] =  @data[date][hour][order.product.name] + 1
          end
        end
      end
    end
  end
end
