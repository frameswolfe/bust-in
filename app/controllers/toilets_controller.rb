class ToiletsController < ApplicationController
  before_action :set_toilet, only: %i[show edit update destroy]

  def index
    @toilets = Toilet.all
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

  def edit; end

  def update
    if @toilet.update(toilet_params)
      redirect_to toilet_path(@toilet), notice: "Garden was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @toilet.destroy
    redirect_to toilets_path, notice: "Garden was successfully destroyed."
  end

  private

  def toilet_params
    params.require(:toilet).permit(:location, :description, :access_info, :cost_per_minute)
  end

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end
end
