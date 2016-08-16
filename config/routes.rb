Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'posts#landing_page'

get '/' => 'homes#index'

get '/profiles' => 'profiles#index'
get '/profile/new' => 'profiles#new'
post '/profile/' => 'profiles#create'
get '/profile/:id' => 'profiles#show'
get '/profile/:id/edit' => 'profiles#edit'
patch '/profile/:id' => 'profiles#update'
delete '/profile/:id' => 'profiles#destroy'

get '/blogs' => 'posts#index'
get '/blog/:id' => 'posts#show'

get '/comments' => 'comments#index'
get '/comment/:id' => 'comments#show'

get '/books' => 'books#index'
get '/book/:id' => 'books#show'

end
