class ResourcesController < ApplicationController
  def index
    slots = (0..23).map{|i| "#{i}:00" }
    now = Time.now
    dates = (0..3).map{|i| now + i.days}
    resources= [
      {name: 'Ali Sahudinov'},
      {name: 'Zverev S.'},
      {name: 'Abram Stijevich'}
    ]
    respond_with(resources: resources, slots: slots, dates: dates)
  end
end
