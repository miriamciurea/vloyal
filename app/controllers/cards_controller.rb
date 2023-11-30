class CardsController < ApplicationController
  def index
    @cards = current_user.cards
    @categories = {}

    @cards.each do |card|
      if @categories[card.brand.category.name]
        @categories[card.brand.category.name] << card
      else
        @categories[card.brand.category.name] = [card]
      end
    end

    @page_cards = true
  end

  # def new
  #   @card = Card.new
  # end

  def create
    @brand = Brand.find(params[:brand_id])
    @card = Card.new
    @card.brand = @brand
    @card.user = current_user
    @card.save
    # redirect_to brands_path, notice: "card created successfully!"
    head :ok
  end


# def card_params
#   params.require(:card).permit(:stamps, :brand_id, :brand_id, :user_id)
# end

end
