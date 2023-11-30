class BrandsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @locations = Location.all
    @brands = Brand.order(rating: :desc, name: :asc)
    @page_brands = true

    if params[:query].present?
      sql_subquery = <<~SQL
        brands.name @@ :query
        OR brands.menu @@ :query
        OR categories.name @@ :query
      SQL
      @brands = @brands.joins(:category).where(sql_subquery, query: params[:query])
    end

    location = [current_user.latitude, current_user.longitude]

    respond_to do |format|
      format.html
      format.text { render partial: "brands/list", locals: {brands: @brands, user_location: location }, formats: [:html] }
    end
  end

  def update_user_location
    @brands = Brand.order(rating: :desc, name: :asc)
    current_user.update(
      latitude: params[:user_location][:latitude],
      longitude: params[:user_location][:longitude]
    )

    location = [current_user.latitude, current_user.longitude]

    p "Locaton is #{location}"

    sleep(2)
    respond_to do |format|
      format.text { render partial: "brands/list", locals: {brands: @brands, user_location: location}, formats: [:html] }
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @location = Location.find(params[:id])
    @page_brands = true
  end

  def map
    @locations = Location.all
    @page_map_brands = true
  end
end
