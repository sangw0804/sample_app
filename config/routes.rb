Rails.application.routes.draw do

  get '/signup' => 'users#new'

  post '/signup' => 'users#create'

  get '/help' => 'static_pages#help'

  get '/about' => 'static_pages#about'

  get '/contact' => 'static_pages#contact'

  root 'static_pages#home'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :users
end
