class LocationsController < ApplicationController
  def create
    @location = Location.new(location_params)
    @location.brand_id = params[:brand_id]
    if @location.save
      redirect_to edit_brand_path(params[:brand_id])
    else
      render 'brands/edit', status: :unprocessable_entity
    end
  end

  private

  def location_params
    params.require(:location).permit(:phone_number, :address)
  end
end
