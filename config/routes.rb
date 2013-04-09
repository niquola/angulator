module AngularRoutes
  def self.resources
    @resources ||=[]
  end

  def ng_resources(name)
    AngularRoutes.resources<< name
    self.resources(name)
  end

  def ng_resource(name)
    AngularRoutes.resources<< name
    self.resource(name)
  end
end


Angulator::Application.routes.draw do
  self.extend(AngularRoutes)


  ng_resources :clients
  ng_resources :roadmaps
  ng_resource  :calendar
  ng_resources :resources
  ng_resources :monthly_resources
  ng_resources :weekly_resources
  ng_resources :directives
  root to: 'clients#index'
end
