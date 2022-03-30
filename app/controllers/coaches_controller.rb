class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end

  def new
  end

  def create
    @coach = Coach.create!(coach_params)
    redirect_to "/coaches"
  end

  def show
    @coach = Coach.find(params[:id])
  end

  private

  def coach_params
    params.permit(:name, :club, :years_experience, :recruiting_athletes)
  end
end
