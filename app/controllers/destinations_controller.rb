class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def create
    @school = School.find(params[:school_id])
    @destination = Destination.new(destination_params)
    @destination.school = @school
    @destination.save
    redirect_to school_destinations_path
  end

  def new
    @school = School.find(params[:school_id])
    @destination = Destination.new
  end

  private

  def destination_params
    params.require(:destination).permit(:university, :number_of_students)
  end
end
