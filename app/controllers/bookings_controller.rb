class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @toilet = Toilet.find(params[:toilet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @toilet = Toilet.find(params[:toilet_id])
    redirect_to home_path(@toilet) if @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :toilet_id)
  end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to home_path(@booking.list)
  # end
end
