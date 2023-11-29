class RewardsController < ApplicationController
  def index
    @page_rewards = true
    @rewards = Reward.all
    @cards = Card.all
  end
end
