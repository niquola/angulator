class ClientsController < ApplicationController
  respond_to :json, :html

  def index
    limit = 10
    page = (params[:page] || 0).to_i

    @items = Client
    .search(params[:search])
    .limit(limit)
    .offset(page*limit)
    .order(:name)

    respond_with(@items)
  end

  def show
    @client = Client.find(params[:id])
    respond_with @client
  end

  def edit
    @client = Client.find(params[:id])
    respond_with @client
  end

  def create
    @client = Client.new(sanitize_attrs(params[:client]))
    @client.save
    render json: @client
  end

  def update
    @client = Client.find(params[:id])
    @client.update_attributes(sanitize_attrs(params[:client]))
    render json: @client
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    render json: @client
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
