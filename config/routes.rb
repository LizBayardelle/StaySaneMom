Rails.application.routes.draw do
  resources :blogs
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

  get 'home/index'
  get 'home/house'
  get 'home/spouse'
  get 'home/kids'
  get 'home/self'
  get 'home/tools'


end
