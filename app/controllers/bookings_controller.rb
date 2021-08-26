class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @toilet = Toilet.find(params[:toilet_id])
  end

  def create
    @booking = Booking.new(start_time: Time.now, end_time: (Time.now + 10))
    @toilet = Toilet.find(params[:toilet_id])
    if @booking.save
      redirect_to toilets_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to home_path(@booking.list)
  # end
end
