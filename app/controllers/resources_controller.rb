class ResourcesController < ApplicationController
  def index
    slots = (0..23).map{|i| "#{i}:00" }
    now = Time.now
    dates = (0..3).map{|i| now + i.days}
    resources= [
      {name: 'Ali Sahudinov',
       events: [
          {time: 1, service: 'Strijka'},
          {time: 4, service: 'Nogti'},
          {time: 23, service: 'Nogti'},
       ]
      },
      {name: 'Arni',
       events: [
          {time: 6, service: 'Strijka'},
          {time: 14, service: 'Nogti'},
          {time: 21, service: 'Nogti'},
       ]
      }
    ]
    respond_with(resources: resources, slots: slots, dates: dates)
  end
end
