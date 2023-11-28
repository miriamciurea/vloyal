class CardsController < ApplicationController
  def index
    @cards = current_user.cards
  end
end
