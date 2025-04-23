Rails.application.routes.draw do
  root "home#index"

  resources :teams do
    resources :players, shallow: true
  end

  resources :matches
  resources :results
end
