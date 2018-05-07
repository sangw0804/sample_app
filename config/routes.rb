Rails.application.routes.draw do

  get '/signup' => 'users#new'

  post '/signup' => 'users#create'

  get '/help' => 'static_pages#help'

  get '/about' => 'static_pages#about'

  get '/contact' => 'static_pages#contact'

  root 'static_pages#home'

  resources :users
end
