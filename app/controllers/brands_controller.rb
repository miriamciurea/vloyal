class BrandsController < ApplicationController
  def index
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
      format.html #continue getting the view file as usual
      format.text {render partial: "brands/list", locals: {brands: @brands}, formats: [:html]}
    end
  end
end
