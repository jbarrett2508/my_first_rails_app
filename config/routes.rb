Rails.application.routes.draw do
  resources :foos

  resources :stats
  get 'stats' => 'stats#index', as: 'stats_path'

    resource :calendar, only: [:show], controller: :calendar
    get 'calendar' => 'calendar#show'

  default_url_options host: 'localhost', port:3000

  resources :posts do
    resources :comments, :only => [:create]
  end

  resources :clients

  get 'auth/:provider/callback', to: 'sessions#create'

  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup',  }

  root :to => 'welcome#hello'

  get 'hello' => 'welcome#hello'

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'

  delete '/logout',
    to: 'sessions#destroy'

  get 'verification/:token', to: 'users#verify', as: 'verify_email'

end
