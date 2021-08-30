if @review.persisted?
  json.form json.partial!('reviews/form.html.erb', school: @school, review: Review.new)
  json.inserted_item json.partial!('schools/review.html.erb', review: @review)
else
  json.form json.partial!('reviews/form.html.erb', school: @school, review: @review)
end
