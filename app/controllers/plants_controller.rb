class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = find_plant
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = find_plant
    plant.update(plant_params)
    render json: plant, status: 201
  end

  def destroy
    plant = find_plant
    plant.destroy
    render json: [], status: 200
  end
  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
  def find_plant
    plant = Plant.find(params[:id])
  end
end
