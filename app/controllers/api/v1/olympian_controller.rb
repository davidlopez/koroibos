class Api::V1::OlympianController < ApplicationController
  def index
    params[:age] ? olympian_age : all_olympians
  end

  private

    def all_olympians
      render json: OlympianCollection.new(Olympian.all)
    end

    def olympian_age
      render json: OlympianCollection.new(Olympian.get_by_age_class(params[:age]))
    end

    def error_age
      render json: {error: 'Unknown age class'}, status: 400
    end
end
