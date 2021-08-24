class ToiletsController < ApplicationController
  before_action :set_toilet, only: %i[show]

  def index
    @toilets = Toilet.all
  end

  def show; end

  private

  def set_toilet
    @toilet = Toilet.find(params[:id])
  end
end
