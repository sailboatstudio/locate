Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do

    ## Authentication
      patch 'users', to: 'users/users#update'
      
      devise_for :users,
        path_names: {
          sign_in: 'sessions',
          sign_out: 'sessions'
        },
        controllers: {
          sessions: 'v1/users/sessions',
          registrations: 'v1/users/registrations'
        }
      post 'users/sessions/refresh', to: 'application#refresh', as: 'refresh_user_session'

    ## Scaffolded Resources
      

    ## Test
      get 'test', to: 'application#test'


  end
end
