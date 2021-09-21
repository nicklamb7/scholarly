class ScholarshipsController < ApplicationController
  def index
    @scholarships = Scholarship.all

    if params[:query].present?
      @scholarships = @scholarships.where('title || description ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'scholarships/list', locals: { scholarships: @scholarships }, formats: [:html] }
    end
  end

  def create
    @scholarship = Scholarship.new(scholarship_params)
    # we need `school_id` to associate scholarship with corresponding school
    @school = School.find(params[:school_id])
    @scholarship.school = @school
    if @scholarship.save
      redirect_to school_path(@school)
    else
      render :new
    end
  end

  def new
    @school = School.find(params[:school_id])
    @scholarship = Scholarship.new
  end

  private

  def scholarship_params
    params.require(:scholarship).permit(:title, :description)
  end
end
