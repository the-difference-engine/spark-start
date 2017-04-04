Rails.application.routes.draw do
  # namespace :admin do
  #   get 'users/new'
  # end

  # namespace :admin do
  #   get 'users/create'
  # end

  # namespace :admin do
  #   get 'users/edit'
  # end

  # namespace :admin do
  #   get 'users/update'
  # end

  # namespace :admin do
  #   get 'users/destroy'
  # end

  # namespace :admin do
  #   get 'users/index'
  # end

  # namespace :admin do
  #   get 'users/show'
  # end

  # namespace :admin do
  #   get 'admins/create'
  # end

  # namespace :admin do
  #   get 'books/new'
  # end

  # namespace :admin do
  #   get 'books/create'
  # end

  # namespace :admin do
  #   get 'books/edit'
  # end

  # namespace :admin do
  #   get 'books/update'
  # end

  # namespace :admin do
  #   get 'books/destroy'
  # end

  # namespace :admin do
  #   get 'books/index'
  # end

  # namespace :admin do
  #   get 'books/show'
  # end

  namespace :admin do
   resources :books, :users, :posts
   get "/" => "admins#index"
  end

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/auth0/user" => "auth0#user"
  get "/auth/failure" => "auth0#failure"
  # get '/admin' => 'admin#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'

  get '/' => 'homes#index'
  get '/theme' => 'homes#theme'
  get '/howitworks' => 'homes#how'
  get '/mission' => 'homes#mission'
  get '/freevideos' => 'homes#videos'

   resources :profiles

	get '/blog' => 'posts#index'
	get '/blog/new' => 'posts#new'
	post '/blog' => 'posts#create'
	get '/blog/dashboard' => 'posts#dashboard'
	get '/blog/:id' => 'posts#show'
	get '/blog/:id/edit' => 'posts#edit'
	patch '/blog/:id' => 'posts#update'
	delete '/blog/:id' => 'posts#destroy'

	resources :categories

	get '/tags' => 'tags#index'
	post '/tag' => 'tags#create'
	patch '/tag' => 'tags#update'
	delete '/tag/:id' => 'tags#destroy'

	# get '/comments' => 'comments#index'
	# get '/comment/:id' => 'comments#show'
	post '/comments' => 'comments#create'

	resources :books do
		get :download_pdf
		resources :authors do
	    end
	end

	get '/logout' => 'auth0#logout'

	get '/users' => 'users#index'

 namespace :api do 
    namespace :v1 do 
      get '/users' => 'users#index'
      put '/users/:id' => 'users#update'
    end
  end

end