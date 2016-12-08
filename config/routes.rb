Rails.application.routes.draw do

  root 'charges#index'

  # Routes for the Event resource:
  # CREATE
  get "/events/new", :controller => "events", :action => "new"
  post "/create_event", :controller => "events", :action => "create"

  # READ
  get "/events", :controller => "events", :action => "index"
  get "/events/:id", :controller => "events", :action => "show"

  # UPDATE
  get "/events/:id/edit", :controller => "events", :action => "edit"
  post "/update_event/:id", :controller => "events", :action => "update"

  # DELETE
  get "/delete_event/:id", :controller => "events", :action => "destroy"
  #------------------------------

  # Routes for the Charge resource:
  # CREATE
  get "/charges/new", :controller => "charges", :action => "new"
  post "/create_charge", :controller => "charges", :action => "create"

  # READ
  get "/charges", :controller => "charges", :action => "index"
  get "/charges/:id", :controller => "charges", :action => "show"

  # UPDATE
  get "/charges/:id/edit", :controller => "charges", :action => "edit"
  post "/update_charge/:id", :controller => "charges", :action => "update"

  # DELETE
  get "/delete_charge/:id", :controller => "charges", :action => "destroy"
  #------------------------------

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"
end
