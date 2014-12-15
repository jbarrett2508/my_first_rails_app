class CalendarController < ApplicationController

  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

    def index
      @events = Event.all
      @events_by_date = @events.group_by(&:date)
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
    end

end
