class Api::V1::EventsController < ApplicationController
  def index
    render json: SportCollection.new(Sport.all)
  end
end
