# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    get 'entries/new'
    get 'entries/create'
    get 'places/index'
    get 'places/show'
    get 'places/new'
    get 'places/create'
    resources :places do
      resources :entries, only: [:new, :create]
    end
    root 'places#index'
  end
  
  # Defines the root path route ("/")
  # get("/", { :controller => "articles", :action => "index" })
