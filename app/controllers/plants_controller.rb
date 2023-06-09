class PlantsController < ApplicationController
  def create
    # Find garden
    @garden = Garden.find(params[:garden_id])
    # Inicializar la planta
    @plant = Plant.new(plant_params)
    # Asignar garden
    @plant.garden = @garden
    # Conditional
    if @plant.save
      # Si se guarda X
      redirect_to garden_path(@garden)
    else
      # Si no se guarda Y
      @plants = @garden.plants
      render "gardens/show", status: :unprocessable_entity
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
