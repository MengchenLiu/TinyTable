class ReviewsController < ApplicationController


  def new
	@review = Review.new
  end

  def edit
    @review = Review.find_by(id: params["id"])
  end

  def show
    @review = Review.find_by(user_id: session["user_id"],restaurant_id:params["rest_id"])
  end
  
  def create
    @review = Review.new
    @review.user_id = session["user_id"]
    @review.restaurant_id = params["rest_id"]
	@review.content = params["content"]
	@review.score = params["score"]
    if @review.save
		redirect_to "/restaurants/#{@review.restaurant_id}", notice: "Thanks for review! You can see your review now!"
    else
      render 'new'
    end

  end

  def update
    @review = Review.find_by(id: params["id"])
	@review.content = params["content"]
	@review.score = params["score"]
    if @review.save
		redirect_to "/restaurants/#{@review.restaurant_id}", notice: "Edit review successfully! You can see your review now!"
    else
      render 'edit'
	end
  end  
  
  def destroy
    review = Review.find_by(id: params["id"])
    review.destroy
    redirect_to "/reviews"
  end


end
