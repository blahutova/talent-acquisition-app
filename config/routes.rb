Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get '/categories' => 'categories#index'
  get '/categories/:id' => 'categories#show', as: :category
  get '/users/:user_id/queries' => 'queries#index'
  get '/users/:user_id/queries/:id' => 'queries#show', as: :query
end
