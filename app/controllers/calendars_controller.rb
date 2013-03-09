class CalendarsController < ApplicationController
  respond_to :json, :html

  def show
    current_date = Date.today
    start_date = current_date.beginning_of_week
    end_date = current_date.end_of_week

    @days = (start_date..end_date).to_a

    respond_with(days: @days, hours: (0..24))
  end
end
