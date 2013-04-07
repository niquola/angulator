class MonthlyResourcesController < ApplicationController
  def index
    month = [
      [
        {label: 'Day1', resources: [{name: "Zverev", load: 80}, {name: 'Rafael', load: 10} ]},
        {label: 'Day2', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day3', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day4', resources: [{name: "Zverev", load: 80}, {name: 'Rafael', load: 10} ]},
        {label: 'Day5', resources: [{name: "Zverev", load: 80} ]}
    ],
      [
        {label: 'Day1', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day2', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day3', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day4', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day5', resources: [{name: "Zverev", load: 80} ]}
    ],
      [
        {label: 'Day1', resources: [{name: "Zverev", load: 80}, {name: 'Rafael', load: 10} ]},
        {label: 'Day2', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day3', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day4', resources: [{name: "Zverev", load: 80}, {name: 'Rafael', load: 10} ]},
        {label: 'Day5', resources: [{name: "Zverev", load: 80} ]}
    ],
      [
        {label: 'Day1', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day2', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day3', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day4', resources: [{name: "Zverev", load: 80} ]},
        {label: 'Day5', resources: [{name: "Zverev", load: 80} ]}
    ]
    ]
    respond_with(month: month, resources: month.first.first[:resources])
  end
end
