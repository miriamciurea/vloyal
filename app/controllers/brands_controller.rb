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

    @location = [session[:lat], session[:lng]]
    respond_to do |format|
      format.html
      format.text { render partial: "brands/list", locals: {brands: @brands, user_location: location }, formats: [:html] }
    end
  end

  def get_user_location
    @brands = Brand.order(rating: :desc, name: :asc)
    respond_to do |format|
      format.text { render partial: "brands/list", locals: {brands: @brands, user_location: [session[:lat], session[:lng]]}, formats: [:html] }
    end
  end

  def set_user_location
    @brands = Brand.order(rating: :desc, name: :asc)
    current_user.update(
      latitude: params[:user_location][:latitude],
      longitude: params[:user_location][:longitude]
    )

    session[:lat] = current_user.latitude
    session[:lng] = current_user.longitude

    p "Locaton is #{location}"

    respond_to do |format|
      format.text { render partial: "brands/list", locals: {brands: @brands, user_location: [session[:lat], session[:lng]]}, formats: [:html] }
    end
  end

  def show
    @locations = Location.all
    @brand = Brand.find(params[:id])
    @location = Location.find(params[:id])
    @page_brands = true
  end

  def map
    # if there is a location in the params, we only use that for the marker
    @brand = Brand.all
    if params[:address]
      @locations = Location.where(address: params[:address])
    else
      @locations = Location.all
    end
    @page_map_brands = true

    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {location: location}),
        marker_html: render_to_string(partial: "marker")
        # info_window_html: render_to_string(partial: "info_window", locals: { location: location})
      }
    end
  end

  def increment
    brand = Brand.find(params[:id])
    user = User.find(params[:user_id])
    @card = user.cards.find_by(brand_id: brand.id)

    if card
      card.stamps += 1
      if card.stamps == card.brand.card_style.max_stamps
        # add reward
        @reward = Reward.new(card_id: card.id)
        @reward.save
        @reward.generate_qrcode
        card.stamps = 0
      end
      card.save
    end

    respond_to do |format|
      format.json
    end
  end

  def user_brand(user)
    @user = user
  end

  def new
    @brand = Brand.new
    @reward_type = RewardType.new
    @location = Location.new
    @category = Category.new
    @card_style = CardStyle.new
  end

  def create
    brand = Brand.new(brand_params)
    brand.user_id = params[:user_id]
    if @brand.save
      redirect_to user_path(params[:user_id]), notice: "brand created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:category_id, :name, :description, :menu, :website, :rating, :card_style_id, :reward_type_id, :user_id)
  end

end
