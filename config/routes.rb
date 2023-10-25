Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :quotes
  get "/quotes/:id/add_category", to: "quotes#add_category", as: "add_category"
  post "/quotes/:id/add_category", to: "quotes#add_category", as: "add_category_post"

  namespace :api do
    namespace :v1 do
      resources :quotes
    end
  end

  resources :categories
end
