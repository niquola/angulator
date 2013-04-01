class CalendarsController < ApplicationController
  respond_to :json, :html

  def show
    current_date = Date.today
    start_date = current_date.beginning_of_week
    end_date = current_date.end_of_week

    @days = (start_date..end_date).to_a

    respond_with(data)
  end

  def data
    {
      timespans: (0..23).to_a,
      resources: [
        {
          name: 'AjBolit',
          events: [
             {name: 'Visit 1', time: 2, duration: 0.6},
             {name: 'Visit 2', time: 4, duration: 1.2},
             {name: 'Visit 3', time: 6, duration: 3.1}
          ]
        },
        {
          name: 'Valerjan',
          events: [
             {name: 'Visit 1', time: 1, duration: 0.6},
             {name: 'Visit 2', time: 7, duration: 1.2}
          ]
        },
        {
          name: 'Jivago',
          events: [
             {name: 'Visit 1', time: 3, duration: 3}
          ]
        }
      ]
    }
  end
end
