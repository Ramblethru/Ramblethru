Rails.application.routes.draw do

  root 'home#index'

  resources :users
  resources :rambles do
    resources :notes#, shallow: true
      get 'notes/:id/delete' => 'notes#destroy'
  end
  resources :locations
  resources :discovers, :only => [:show, :create]
  resources :notes, :only => [:index, :destroy]
  resources :logins, :only => [:new, :create]
  get 'logout' => 'logins#destroy'
  get '/auth/:provider/callback', to: 'users#create_auth'
  get '/users/:id/edit_bio', to: 'users#edit_bio', as: :edit_bio
  get '/users/:id/edit_name', to: 'users#edit_name', as: :edit_name
  get '/users/:id/edit_lives_in', to: 'users#edit_lives_in', as: :edit_lives_in

  get '/rambles/:id/edit_name', to: 'rambles#edit_name', as: :edit_ramble_name

  post 'rambles/:id/add_api', to: 'rambles#add_api', as: :add_api
  post 'rambles/:id/add_instagram', to: 'rambles#add_instagram', as: :add_instagram
  get '/about' => 'pages#about'

  # post '/users/:user_id/rambles/new' => 'rambles#new', as: 'new_user_ramble_post'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
