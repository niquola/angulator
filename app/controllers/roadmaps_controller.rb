class RoadmapsController < ApplicationController
  def index
    @items = Roadmap.all
    respond_with @items
  end

  def show
    @item = Roadmap.find(params[:id])
    respond_with @item
  end

  def create
    @item = Roadmap.new(sanitize_attrs(params[:item]))
    unless @item.description
      @item.description = <<-ROADMAP
Buisiness Valuse
* UX
* Happiness
* Satisfaction
Milestones
* Design
* Implement
* Deploy
      ROADMAP
    end
    @item.save
    render json: @item
  end

  def update
    @item = Roadmap.find(params[:id])
    @item.update_attributes(sanitize_attrs(params[:item]))
    render json: @item
  end

  private

  def sanitize_attrs(attrs)
    attrs = attrs.dup
    attrs.delete(:id)
    attrs.delete(:updated_at)
    attrs.delete(:created_at)
    attrs.delete(:errors)
    attrs
  end

end
