class ToiletsController < ApplicationController
  before_action :set_toilet, only: %i[show edit update destroy]

  def index
    if params[:user_id]
      @toilets = User.find(params[:user_id]).toilets
    else
      @toilets = Toilet.all
    end
    @markers = @toilets.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        id: flat.id
      }
    end
  end

  def show; end

  def new
    @toilet = Toilet.new
  end

  def create
    @toilet = Toilet.new(toilet_params)
    @toilet.user = current_user
    if @toilet.save!
      redirect_to toilet_path(@toilet)
    else
      render :new
    end
  end

  def edit
    redirect_to toilet_path(@toilet) unless @toilet.user_id == current_user.id
  end

  def update
    if @toilet.update(toilet_params)
      redirect_to toilet_path(@toilet), notice: "Toilet was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @toilet.destroy
    redirect_to toilet_path(@toilet) unless @toilet.user_id == current_user.id
    redirect_to toilets_path, notice: "Toilet was successfully destroyed."
  end

  private

  def toilet_params
    params.require(:toilet).permit(:location, :description, :access_info, :cost_per_minute, :photo)
  end

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end
end
