Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/create'

  get 'signups/new'

	resources :posts
	resources :users

	#implement destroy function tomorrow, as well as signup. and home page with appropriate links.

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	root 'posts#index'
end