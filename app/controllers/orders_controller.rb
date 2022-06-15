# frozen_string_literal: true

# Controller for listing and showing all Orders
class OrdersController < ApplicationController
  before_action :set_order, except: [:index]
  before_action :set_date, only: [:index]

  def index
    @orders = Order.where(Order.arel_table[:delivery_time].gteq(@date.beginning_of_day))
                   .where(Order.arel_table[:delivery_time].lteq(@date.end_of_day))
                   .includes(:customer, :product)
                   .order(:delivery_time)
  end

  def show
    set_order
  end

  def cancel
    if @order
      @order.update_columns(status: 'cancelled', comment: params[:comment])
      flash[:notice] = "Order ##{@order.id} Cancelled Successfully"
    else
      flash[:notice] = "Order not found with id ##{params[:id]}"
    end

    redirect_to orders_path
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
    @order = Order.find_by(id: params[:id])
  end
end
