class CardsController < ApplicationController
  def index
    @cards = current_user.cards
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
    redirect_to brands_path, notice: "card created successfully!"
  end

private

# def card_params
#   params.require(:card).permit(:stamps, :brand_id, :brand_id, :user_id)
# end

end
