class RoadmapsController < ApplicationController
  def index
    @items = Roadmap.all
    respond_with @items
  end

  def show
    @item = Roadmap.find(params[:id])
    respond_with @item
  end
end
