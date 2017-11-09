Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'cocktails#index'
resources :cocktails, only: [:index, :new, :create, :show]
end

# GET "cocktails"
# GET "cocktails/42"
# GET "cocktails/new"
# POST "cocktails"
