Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index] #this makes new index method that lets u grab all artworks of user
    resources :comments, only: [:index] 
  end

  resources :artworks, only: [:create, :destroy, :index, :show, :update] do
    resources :comments, only: [:index] 
  end
  resources :artwork_shares, only: [:create, :destroy, :index, :show]

  resources :comments, only: [:create, :destroy, :index]


  # get 'users', to: 'users#index'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as: 'user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'



  # Defines the root path route ("/")
  # root "articles#index"
end
