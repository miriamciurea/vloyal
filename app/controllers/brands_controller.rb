class BrandsController < ApplicationController

  def show
    @brand = Brand.find(params[:id])
    @location = Location.find(params[:id])
  end
end
