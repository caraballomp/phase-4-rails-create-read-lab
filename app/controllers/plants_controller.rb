class PlantsController < ApplicationController

    def index 
        render json: Plant.all
    end

    def show
        plant = Plant.where(id: params[:id]).first
        render json: plant
    end

    def create
        plant = Plant.new(name: params[:name], image: params[:image], price: params[:price])
        if (plant.save)
            render json: plant, status: :created
        else
            render json: {error: true, msg: plant.errors}
        end
    end 

end
