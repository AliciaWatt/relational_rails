class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end

  def new
  end

  def edit
    @coach = Coach.find(params[:id])
  end

  def create
    @coach = Coach.create!(coach_params)
    redirect_to "/coaches"
  end

  def update
    @coach = Coach.find(params[:id])
    @coach.update(edit_coach_params)
    redirect_to "/coaches/#{@coach.id}"
  end

  def show
    @coach = Coach.find(params[:id])
  end

  private

  def coach_params
    params.permit(:name, :club, :years_experience, :recruiting_athletes)
  end

  def edit_coach_params
    params.permit(:name, :club, :years_experience, :recruiting_athletes)
  end
end
