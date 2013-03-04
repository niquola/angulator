class WelcomeController < ApplicationController
  respond_to :json, :html
  def index
    limit = 10
    page = (params[:page] || 0).to_i
    user = params[:search].present? ? params[:search] : 'User'
    @users  = (page*limit..(page + 1)*limit).to_a.map do |i|
      {name: "#{user} #{i}", email: "user#{i}@email.com"}
    end
    respond_with(@users)
  end
end
