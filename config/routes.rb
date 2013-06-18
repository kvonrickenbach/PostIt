Postit::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end

  resources :users, only: [:create]
end
