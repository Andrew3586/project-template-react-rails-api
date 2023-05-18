class DogHousesController < ApplicationController
    def show
        dog_house = Dog_house.find(params[:id])
        reviews = dog_house.reviews
        render json: {dog_house:dog_house, reviews:reviews}

    end

    def index
        user =User.find(params[:user_id])
        dog_houses = user.dog_houses#Dog_house.where(user_id:user.id)
        render json: {dog_houses:dog_houses}
    end

    def create
        user = User.find(params[:user_id])
        if user.dog_houses.create(set_params)
            render json: {message: "Dog house created"}
    end

    def update
        user = User.find(params[:user_id])
        if user.dog_houses.update(set_params)
            render json: {message: "dog house is updated"}
        end

    def destroy
        dog_house =Dog_house.find(params[:id])
        if dog_house.destroy
            render json: {message: "dog house is deleted."}
        end
    end

    end
    private

    def set_params
        params.permit(params[:name],params[:address], params[:price], params[:capacity], params[:material])
    end
end
