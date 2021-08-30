class SchoolsController < ApplicationController
  def index
    @schools = School.all

    @markers = @schools.geocoded.map do |school|
      {
        lat: school.latitude,
        lng: school.longitude,
        info_window: render_to_string(partial: "info_window", locals: { school: school })
      }
    end

    if params[:query].present?
    sql_query = "name ILIKE :query OR school_type ILIKE :query"
      @schools = School.where(sql_query, query: "%#{params[:query]}%")
    else
      @schools = School.all
    end
  end

  def show
    @school = School.find(params[:id])
    @review = Review.new
  end
end
