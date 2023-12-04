class RewardsController < ApplicationController
  def index
    @page_rewards = true
    @rewards = current_user.rewards
    @cards = Card.all
  end
end
