CensorCms::Application.routes.draw do

  resources :sections_sidebars

  resources :sidebars

  resources :images do
    member do
      post 'saveimage' => :create
      get 'saveimage' => :create
    end
  end

  resources :upload_sections

  get "home/index"

  resources :settings

  resources :user_accounts

  resources :accounts

  resources :uploads do
    member do
      post 'saveupload' => :create
      get 'saveupload' => :create
    end
  end

  resources :user_sections

  resources :user_pages

  resources :users

  resources :sections do
    collection do
      post :sort
    end
  end

  resources :pages

  resource :sessions do
    get 'log_in' => :new
    post 'log_in' => :create
    delete 'log_out' => :destroy
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Sessions
  match "log_out" => "sessions#destroy", :as => "log_out", via: [:get, :post]
  match "log_in" => "sessions#new", :as => "log_in", via: [:get, :post]
  match "sign_up" => "users#new", :as => "sign_up", via: [:get, :post]
  match "saveupload" => "uploads#create", :as => "saveupload", via: [:get, :post]
  match "saveimage" => "images#create", :as => "saveimage", via: [:get, :post]

  get 'auth/failure', to: 'home#index'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/:provider', to: 'sessions#create'
  get 'oauth2callback', to: 'sessions#create'
  get 'auth/facebook/setup', to: 'sessions#setup_facebook'
  get 'auth/linkedin/setup', to: 'sessions#setup_linkedin'
  get 'auth/googleplus/setup', to: 'sessions#setup_googleplus'

  #root :to => "users#new"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
