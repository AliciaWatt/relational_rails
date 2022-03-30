class AthletesController < ApplicationController
  def index
    @athletes = Athlete.championship_qualifier?
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

  def destroy
    athlete = Athlete.find(params[:id])
    athlete.destroy
    redirect_to "/athletes"
  end

  private

  def athlete_params
    params.permit(:name, :rank, :championship_qualifier)
  end
end
