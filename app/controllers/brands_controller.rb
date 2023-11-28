class BrandsController < ApplicationController
  def index
    @locations = Location.all
    @brands = Brand.order(rating: :desc, name: :asc)

    if params[:query].present?
      sql_subquery = <<~SQL
        brands.name @@ :query
        OR brands.menu @@ :query
        OR categories.name @@ :query
      SQL
      @brands = @brands.joins(:category).where(sql_subquery, query: params[:query])
    end

    respond_to do |format|
      format.html
      format.text { render partial: "brands/list", locals: {brands: @brands}, formats: [:html] }
    end
  end

  def update_location
    @latitude = params[:latitude]
    @longitude = params[:longitude]

    # Process the latitude and longitude as needed
    # (e.g., save to the database, perform calculations, etc.)

    render json: { status: 'success' }
  end
end
