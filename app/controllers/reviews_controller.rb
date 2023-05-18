class ReviewsController < ApplicationController
    def update
        review = Review.find(params[:id])
        if review.update(review_param)
            render json: {message: "review updated"}
        end
    end

    def create
        dog_house = Dog_house.find(params[:dog_house_id])
        if dog_house.reviews.create(review_param)
            render json: {message: "review created"}
        end

    end

    def destroy
        review =Review.find(params[:id])
        if review.destroy
            render json: {message: "review deleted"}
        end

    end

    private

    def review_param
            params.permit(params[:review], params[:rating])
    end
end
