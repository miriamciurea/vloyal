class RewardsController < ApplicationController
  def index
    @page_rewards = true
    @rewards = current_user.rewards

    @user = User.find(current_user.id)
    @brands = Brand.where('user_id = ?', current_user.id)
    @cards = @user.cards.all
  end
end
