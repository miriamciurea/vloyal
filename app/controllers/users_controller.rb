class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @brands = Brand.where('user_id = ?', current_user.id)
    @cards = @user.cards.all
  end
end
