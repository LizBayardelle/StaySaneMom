Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

  get 'home/index'
  get 'home/house'
  get 'home/spouse'
  get 'home/kids'
  get 'home/self'
  get 'home/tools'

  resources :blogs
  resources :comments, only: [:create, :index, :destroy]

  resources :tasks
  post "tasks/:id/check_task" => "tasks#check_task", as: "check_task"
  post "tasks/:id/uncheck_task" => "tasks#uncheck_task", as: "uncheck_task"


end
