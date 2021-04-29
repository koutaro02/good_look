class MapsController < ApplicationController
  def new
    @map = Map.new
    @maps = Map.all
  end

  def create
    @map = Map.new(map_params)
    binding.pry
    @map.save
  end

  private

  def map_params
      params.require(:map).permit(:spot_name, :address, :latitude, :longitude, :text)
  end
end
