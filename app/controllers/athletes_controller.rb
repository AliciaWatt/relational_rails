class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def edit
    @athlete = Athlete.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:id])
    @athlete.update(athlete_params)
    redirect_to "/athletes/#{@athlete.id}"
  end

  private

  def athlete_params
    params.permit(:name, :rank, :championship_qualifier)
  end
end
