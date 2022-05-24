# frozen_string_literal: true

# Controller for listing and showing all Orders
class OrdersController < ApplicationController
  def index
    set_date
    @orders = Order.where(Order.arel_table[:delivery_time].gteq(@date.beginning_of_day))
                   .where(Order.arel_table[:delivery_time].lteq(@date.end_of_day))
                   .order(:delivery_time)
  end

  def show
    set_order
  end

  private

  def set_date
    @date = if params[:date]
              Date.parse(params[:date])
            else
              Date.current
            end
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
