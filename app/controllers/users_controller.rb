class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bookings = @user.bookings
    @toilets = @user.toilets
  end
end
