Rails.application.routes.draw do

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  # get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
  post 'signup', to:'users#registration'
  post 'signin', to: 'users#session'
  resources :users do
    resources :dog_houses
  end
end
