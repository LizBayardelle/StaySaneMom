Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]

  get 'home/index'
  get 'home/house'
  get 'home/spouse'
  get 'home/kids'
  get 'home/self'
  get 'home/tools'
  get 'home/results'

  get 'tags/:tag', to: 'blogs#index', as: :tag
  resources :blogs do
    resources :comments
    collection do
      get :autocomplete
    end
  end
  resources :comments
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

  resources :charges

  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get

end
