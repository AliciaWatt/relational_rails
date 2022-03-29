class CoachAthletesController < ApplicationController
  def index
    @coach = Coach.find(params[:coach_id])
    @athletes = @coach.athletes
  end
end
