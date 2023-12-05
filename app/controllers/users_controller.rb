class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @brand = Brand.find_by('user_id = ?', @user)
    @cards = @user.cards.all
  end
end
