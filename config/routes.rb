Rails.application.routes.draw do
mount SolidusPaypalBraintree::Engine, at: '/solidus_paypal_braintree'
  # This line mounts Solidus's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/store'

  resources :subcategories
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]
  post "users/:id/approve_contributor" => "users#approve_contributor", as: "approve_contributor"
  post "users/:id/approve_sm" => "users#approve_sm", as: "approve_sm"

  get 'home/index'
  get 'home/house'
  get 'home/spouse'
  get 'home/kids'
  get 'home/self'
  get 'home/tools'
  get 'home/results'
  get 'home/allblogs'

  get 'tags/:tag', to: 'blogs#index', as: :tag
  resources :blogs do
    resources :comments
    collection do
      get :autocomplete
    end
  end
  post "blogs/:id/approve_blog" => "blogs#approve_blog", as: "approve_blog"
  post "blogs/:id/unsubmit_blog" => "blogs#unsubmit_blog", as: "unsubmit_blog"

  resources :comments do
    resources :responses
  end
  post "comment/:id/approve" => "comments#approve_comment", as: "approve_comment"
  post "comment/:id/unapprove" => "comments#unapprove_comment", as: "unapprove_comment"
  post "comment/:id/comment_read" => "comments#comment_read", as: "comment_read"
  post "comment/:id/comment_unread" => "comments#comment_unread", as: "comment_unread"

  resources :tasks do
    collection do
      patch :sort
    end
  end
  post "tasks/:id/check_task" => "tasks#check_task", as: "check_task"
  post "tasks/:id/uncheck_task" => "tasks#uncheck_task", as: "uncheck_task"

  resources :occasions
  resources :people
  resources :gifts, only: [:edit, :update, :destroy, :show]

  resources :contributions
  post "contributions/:id/replied_contribution" => "contributions#replied_contribution", as: "replied_contribution"
  post "contributions/:id/unreplied_contribution" => "contributions#unreplied_contribution", as: "unreplied_contribution"

  resources :recipes

  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get


end
