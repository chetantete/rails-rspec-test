# frozen_string_literal: true

# Controller for viewing slots
class SlotsController < ApplicationController
  def index
    set_date
  end

  private

  def set_date
    @date = if params[:date]
              Date.parse(params[:date]).beginning_of_week
            else
              Date.current.beginning_of_week
            end
  end
end
