Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/sessions" => "sessions#create"

    get "/locations" => "locations#index"
    get "/weather" => "users#weather"
    post "/locations" => "locations#create"
    get "/locations/:id" => "locations#show"
    patch "/locations/:id" => "locations#update"
    delete "/locations/:id" => "locations#destroy"

    get "/specials" => "specials#index"
    post "/specials" => "specials#create"
    get "/specials/:id" => "specials#show"
    patch "/specials/:id" => "specials#update"
    delete "/specials/:id" => "specials#destroy"

    get "/users" => "users#index"
    post "/users" => "users#create"
    patch "/users/checkin" => "users#checkin"
    patch "/users/checkout" => "users#checkout"
    patch "/users/logout" => "users#logout"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"



    get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] } 

  end
end
