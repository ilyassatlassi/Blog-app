Rails.application.routes.draw do
  # get 'post/index'
  # get 'post/show'
  # get 'user/index'
  # get 'user/show'
  # root 'pages#hello' # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
  
end

