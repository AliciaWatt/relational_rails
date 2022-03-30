class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end

  def new
  end

  def create
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def coach_params
    params.permit(:name, :club, :years_experience, :recruiting_athletes)
  end
end
