Rails.application.routes.draw do
  #resources :profiles

  resources :resources

  resources :events

  resources :stats
  get 'stats' => 'stats#index', as: 'stats_path'

    resource :calendar, only: [:show], controller: :calendar
    get 'calendar' => 'calendar#show'

  default_url_options host: 'localhost', port:3000

  resources :posts do
    resources :comments, :only => [:create]
  end

  resources :clients

  get 'auth/:provider/callback', to: 'sessions#oauth'

  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup' } do
    member do
      get 'profile' => 'users#profile'
    end
  end

  # get 'my_profile' => 'profiles#edit'

  root :to => 'welcome#hello'

  get 'hello' => 'welcome#hello'

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'

  delete '/logout',
    to: 'sessions#destroy'

  get 'verification/:token', to: 'users#verify', as: 'verify_email'

  get 'events' => 'events#index'

  get 'recipes' => 'recipes#index'

  get 'calculator' => 'calculator#show'

  get 'bio' => 'bio#index'

  get 'contact' => 'contact#show'

end
