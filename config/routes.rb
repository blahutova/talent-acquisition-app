Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' =>  'sessions#destroy', as: :logout

  get '/categories' => 'categories#index'
  get '/categories/new' => 'categories#new', as: :new_category
  post 'categories' => 'categories#create'
  get '/categories/:id' => 'categories#show', as: :category
  get '/categories/:id/edit' => 'categories#edit', as: :edit_category
  patch '/categories/:id' => 'categories#update'
  delete '/categories/:id' => 'categories#destroy'
  get '/categories/:category_id/languages/:language_id/translations' => 'translations#index', as: :translations

  get '/translations/:id' => 'translations#show', as: :translation
  patch '/translations/:id' => 'translations#update'
  get '/translations/:id/edit' => 'translations#edit', as: :edit_translation
  get '/categories/:category_id/languages/:language_id/translations/new' => 'translations#new', as: :new_translation
  post '/categories/:category_id/languages/:language_id/translations' => 'translations#create'
  delete '/translations/:id' => 'translations#destroy'

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
