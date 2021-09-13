class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
  end

  def create
    @destination = Destination.new(destination_params)
    @school = School.find(params[:school_id])
    @destination.school = @school
    if @destination.save
      redirect_to school_path(@school)
    else
      render :new
    end
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
