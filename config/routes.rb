Rails.application.routes.draw do
	resources :posts, only: [:new, :create, :index]

	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	get '/index', to: 'pages#index'
	root 'posts#index'
end