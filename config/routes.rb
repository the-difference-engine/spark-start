Rails.application.routes.draw do
  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/auth0/user" => "auth0#user"
  get "/auth/failure" => "auth0#failure"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'homes#index'

get '/' => 'homes#index'
get '/theme' => 'homes#theme'


get '/profiles' => 'profiles#index'
get '/profile/new' => 'profiles#new'
post '/profile/' => 'profiles#create'
get '/profile/:id' => 'profiles#show'
get '/profile/:id/edit' => 'profiles#edit'
patch '/profile/:id' => 'profiles#update'
delete '/profile/:id' => 'profiles#destroy'

get '/blogs' => 'posts#index'
get '/blog/new' => 'posts#new'
post '/blog/' => 'posts#create'
get '/blog/dashboard' => 'posts#dashboard'
get '/blog/:id' => 'posts#show'
get '/blog/:id/edit' => 'posts#edit'
patch '/blog/:id' => 'posts#update'
delete '/blog/:id' => 'posts#destroy'

get '/categories' => 'categories#index'
post '/category' => 'categories#create'
patch '/category/:id' => 'categories#update'
delete '/category/:id' => 'category#destroy'

get '/tags' => 'tags#index'
post '/tag' => 'tags#create'
patch '/tag' => 'tags#update'
delete '/tag/:id' => 'tags#destroy'

# get '/comments' => 'comments#index'
# get '/comment/:id' => 'comments#show'
post '/comment/' => 'comments#create'

get '/books' => 'books#index'
get '/book/new' => 'books#new'
post 'book/' => 'books#create'
get '/book/:id' => 'books#show'
get '/book/:id/edit' => 'books#edit'
patch '/book/:id' => 'books#update'
delete 'book/:id' => 'books#destroy'

get '/logout' => 'auth0#logout'

get '/users' => 'users#index'


end
