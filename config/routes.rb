Rails.application.routes.draw do
  resources :entries
  resources :places
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  #Login/Logout
  get("/login", { :controller => "sessions", :action => "new" })
  delete("/logout", { :controller => "sessions", :action => "destroy" })

  #Define the root route
  get("/", { :controller => "places", :action => "home" })

  #Custom route for signup
  get ("/signup", { :controller => "users", :action => "new" })
end
