Rails.application.routes.draw do
  resources :players, only: %i[index new create]

  resources :teams do
    resources :players, shallow: true, except: %i[index new create]
  end

  resources :matches
  resources :results

  root "home#index"
end
