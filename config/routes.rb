Rails.application.routes.draw do
  root "orders#index"

  resources :orders do
    resources :terms
  end
end
