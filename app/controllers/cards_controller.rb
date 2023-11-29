class CardsController < ApplicationController
  def index
    @cards = current_user.cards
    @page_cards = true
  end
end
