class CoachAthletesController < ApplicationController
  def index
    @coach = Coach.find(params[:coach_id])
    if params[:sort] == 'asc'
      @athletes = @coach.athletes.alphbabetize
    else
      @athletes = @coach.athletes
    end
  end

  def new
    @coach = Coach.find(params[:coach_id])
  end

  def create
    coach = Coach.find(params[:coach_id])
    coach.athletes.create!(athlete_params)
    redirect_to "/coaches/#{coach.id}/athletes"
  end

  private

  def athlete_params
    params.permit(:name, :rank, :championship_qualifier)
  end
end
