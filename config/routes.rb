Rails.application.routes.draw do
  resources :preauthorizations
  resources :sortings
  root 'home#index'

  get 'admin/store_manager'
  get 'admin/blogs'
  get 'admin/resources'
  get 'admin/drafts'
  get 'admin/users'

  resources :meals
  post "meals/:id/favorite" => "meals#favorite", as: "favorite_meal"
  post "meals/:id/unfavorite" => "meals#unfavorite", as: "unfavorite_meal"

  post 'recipes/search' => 'recipes#index', as: "recipes_search"
  resources :recipes

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :index]
  post "users/:id/approve_contributor" => "users#approve_contributor", as: "approve_contributor"
  post "users/:id/make_contributor" => "users#make_contributor", as: "make_contributor"
  post "users/:id/approve_sm" => "users#approve_sm", as: "approve_sm"

  get 'home/index'
  get 'home/house'
  get 'home/spouse'
  get 'home/kids'
  get 'home/self'
  get 'home/tools'
  get 'home/results'
  get 'home/redirect'

  resources :subcategories

  get 'tags/:tag', to: 'blogs#index', as: :tag
  resources :blogs do
    collection do
      get :autocomplete
    end
  end
  post "blogs/:id/approve_blog" => "blogs#approve_blog", as: "approve_blog"
  post "blogs/:id/unsubmit_blog" => "blogs#unsubmit_blog", as: "unsubmit_blog"
  patch "blogs/:id/update_goody" => "blogs#update_goody", as: "update_goody"
  patch "blogs/:id/toggle_category" => "blogs#toggle_category", as: "toggle_category"

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

  resources :resources
  resources :planner_customs
  resources :purchases


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
