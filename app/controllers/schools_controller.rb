class SchoolsController < ApplicationController
  def index
    @schools = School.all

    if params[:query].present?
      @schools = @schools.where('name ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'schools/list', locals: { schools: @schools }, formats: [:html] }
    end

    @markers = @schools.geocoded.map do |school|
      {
        lat: school.latitude,
        lng: school.longitude
        # info_window: render_to_string(partial: 'schools/info_window', locals: { school: school })
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

  def create
    @school = School.new(school_params)
    @school.save
    redirect_to school_path(@school)
  end

  def new
    @school = School.new
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    @school.update(school_params)
    redirect_to school_path(@school)
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy

    redirect_to schools_path
  end

  private

  def school_params
    params.require(:school).permit(:name, :school_type, :address, :summary, :founded_at, :price, :number_of_pupils, :grade_5_or_above, :aab_or_above, :thumbnail, :logo, :cover)
  end

end
