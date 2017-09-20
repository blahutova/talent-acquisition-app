Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get    '/login' => 'sessions#new', as: :login
  post   '/login' => 'sessions#create'
  delete '/logout' =>  'sessions#destroy', as: :logout

  get '/categories' => 'categories#index'
  get '/categories/:id' => 'categories#show', as: :category

  get '/queries' => 'queries#index', as: :queries
  get '/queries/new' => 'queries#new', as: :new_query
  post 'queries' => 'queries#create'
  get '/queries/:id' => 'queries#show', as: :query
  get '/queries/:id/edit' => 'queries#edit', as: :edit_query
  patch '/queries/:id' => 'queries#update'
  delete '/queries/:id' => 'queries#destroy'

  resources :users

  get '/languages' => 'languages#index', as: :languages
  get '/languages/new' => 'languages#new', as: :new_language
  post 'languages' => 'languages#create'
  get '/languages/:id' => 'languages#show', as: :language
  get '/languages/:id/edit' => 'languages#edit', as: :edit_language
  patch '/languages/:id' => 'languages#update'
  delete '/languages/:id' => 'languages#destroy'

end
