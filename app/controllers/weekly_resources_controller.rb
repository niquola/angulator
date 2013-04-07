class WeeklyResourcesController < ApplicationController
  def index
    res = {name: 'Zaitsev',
      events: [{label: '8:00 Strijka'}, {label: '10:00 Free time'}]
    }
    another = res.dup
    another[:name] = 'Sverev S'
    resources = [res, another]
    respond_with(resources: resources)
  end
end
