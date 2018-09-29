Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show]

  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get

  get 'home/index'
  get 'home/house'
  get 'home/spouse'
  get 'home/kids'
  get 'home/self'
  get 'home/tools'

  resources :blogs do
    resources :comments
  end
  post "comment/:id/approve" => "comments#approve_comment", as: "approve_comment"
  post "comment/:id/unapprove" => "comments#unapprove_comment", as: "unapprove_comment"
  post "comment/:id/comment_read" => "comments#comment_read", as: "comment_read"
  post "comment/:id/comment_unread" => "comments#comment_unread", as: "comment_unread"


  resources :tasks
  post "tasks/:id/check_task" => "tasks#check_task", as: "check_task"
  post "tasks/:id/uncheck_task" => "tasks#uncheck_task", as: "uncheck_task"


end
