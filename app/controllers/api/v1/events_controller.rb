class Api::V1::EventsController < ApplicationController
  def index
    render json: SportCollection.new(Sport.order(:name))
  end

  def show
    event = Event.find(params[:id])
    event ? event_medalists(event) : failed_event
  end

  def event_medalists(event)
    render json: FormatEventById.new(event)
  end

  def failed_event
    render json: {error: "Event not found"}, status: 404
  end
end
