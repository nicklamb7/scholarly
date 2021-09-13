class ReviewsController < ApplicationController
  def create
  @school = School.find(params[:school_id])
  @review = Review.new(review_params)
  @review.school = @school

  respond_to do |format|
    if @review.save
      format.html { redirect_to school_path(@school) }
      format.json # Follow the classic Rails flow and look for a create.json view
    else
      format.html { render 'schools/show' }
      format.json # Follow the classic Rails flow and look for a create.json view
    end
  end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to school_path(@review.school)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
