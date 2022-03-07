Rails.application.routes.draw do
  get 'tasks/new'
  get 'projects/new'
  get 'login/new'
  root 'static_pages#home'
  get 'users/new'
  get 'login', to: 'login#new'
  post 'login', to: 'login#create'
  get 'logout', to: 'login#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :projects
  resources :tasks
end
