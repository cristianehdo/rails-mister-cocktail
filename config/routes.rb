Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :cocktails, only: [:index, :new, :create, :show] do
  collection do
    get "search", to: "cocktails#search"
  end
  resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end


# GET "cocktails"
# GET "cocktails/42"
# GET "cocktails/new"
# POST "cocktails"
# GET "cocktails/42/doses/new"
# POST "cocktails/42/doses"
# DELETE "doses/25"
