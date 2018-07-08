Rails.application.routes.draw do

root   'static_pages#home'
get    '/signup', to: 'users#new'
get    '/login',  to: 'sessions#new'
post   '/login',  to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

resources :users,  only: [:index, :new, :create, :show]
resources :events
resources :attendings, only: [:new, :create, :destroy]
resources :comments, only: [:new, :create, :destroy]

end
