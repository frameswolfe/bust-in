class BookingsController < ApplicationController
  def index
    if params[:user_id]
      @bookings = User.find(params[:user_id]).bookings
    else
      @bookings = Booking.all.order(created_at: :DESC)
    end
  end

  def new
    @booking = Booking.new
    @toilet = Toilet.find(params[:toilet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @toilet = Toilet.find(params[:toilet_id])
    @booking.toilet = @toilet
    @booking.start_time = Time.now
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :duration)
  end
end
