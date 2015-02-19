Rails.application.routes.draw do

  root 'home#index'

  resources :users
  resources :rambles, path: "ramble" do
    resources :notes
      get 'notes/:id/delete' => 'notes#destroy'
  end
  resources :discovers, :only => [:show, :create, :new], path: "discover"
  get 'state_select', to: 'discovers#create'
  
  resources :notes, :only => [:index, :destroy]
  resources :logins, :only => [:new, :create]
  get 'logout' => 'logins#destroy'
  get '/auth/:provider/callback', to: 'users#create_auth'
  get '/users/:id/edit_bio', to: 'users#edit_bio', as: :edit_bio
  get '/users/:id/edit_name', to: 'users#edit_name', as: :edit_name
  get '/users/:id/edit_lives_in', to: 'users#edit_lives_in', as: :edit_lives_in

  get '/rambles/:id/edit_name', to: 'rambles#edit_name', as: :edit_ramble_name
  get '/rambles/:id/edit_start_date', to: 'rambles#edit_start_date', as: :edit_ramble_start_date
  get '/rambles/:id/edit_end_date', to: 'rambles#edit_end_date', as: :edit_ramble_end_date

  post 'rambles/:id/add_api', to: 'rambles#add_api', as: :add_api
  post 'rambles/:id/add_instagram', to: 'rambles#add_instagram', as: :add_instagram

  get '/about' => 'pages#about'
  get 'tags/:tag', to: 'rambles#index', as: :tag
  get 'note_search', to: 'rambles#index'

  patch 'notes/:id' => 'notes#set_share', as: 'set_share'

end
