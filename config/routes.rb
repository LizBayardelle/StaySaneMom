Rails.application.routes.draw do
  root 'home#index'


  get 'admin/resources'
  resources :resources
  resources :planner_customs
  resources :purchases

  resources :meals
  post "meals/:id/favorite" => "meals#favorite", as: "favorite_meal"
  post "meals/:id/unfavorite" => "meals#unfavorite", as: "unfavorite_meal"

  post 'recipes/search' => 'recipes#index', as: "recipes_search"
  resources :recipes

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

  resources :subcategories

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


  resources :capsules do
    resources :capsule_items
  end


  resources :groupings
  resources :variations do
    member do
      delete :delete_image_attachment, as: "delete_image"
    end
  end
  resources :goodies
  resource :cart, only: [:show]
  resources :basket_items, only: [:create, :update, :destroy]
  resources :charges


  match '/:id' => 'high_voltage/pages#show', :as => :static, :via => :get



end
