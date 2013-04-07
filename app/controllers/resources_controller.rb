class ResourcesController < ApplicationController
  def index
    slots = (0..23).map{|i| "#{i}:00" }
    now = Time.now
    dates = (0..3).map{|i| now + i.days}
    resources= [
      {name: 'Ali Sahudinov',
       slots: [
          {time: '00:00'},
          {time: '01:00', service: 'Strijka'},
          {time: '02:00'},
          {time: '03:00'},
          {time: '04:00', service: 'Nogti'},
          {time: '05:00'},
          {time: '06:00'},
          {time: '07:00'}
       ]
      },
      {name: 'Zajcev S.',
       slots: [
          {time: '00:00'},
          {time: '01:00', service: 'Strijka'},
          {time: '02:00'},
          {time: '03:00'},
          {time: '04:00', service: 'Nogti'},
          {time: '05:00'},
          {time: '06:00'},
          {time: '07:00'}
       ]
      }
    ]
    respond_with(resources: resources, slots: slots, dates: dates)
  end
end
