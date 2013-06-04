class CalendarsController < ApplicationController
  def show
    @calendar = Calendar.new(id: params[:id])
    @date_range = Calendar.month_of(Date.today)
  end
end
