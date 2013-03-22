class DirectivesController < ApplicationController
  respond_to :html, :json
  def index
    @items = (1..100).to_a.map do |i|
      {label: Faker::Name.name, mark: i}
    end
    respond_with @items
  end
end
