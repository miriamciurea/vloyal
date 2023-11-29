class RewardsController < ApplicationController
  def index
    @page_rewards = true
    @rewards = Reward.all
  end
end
