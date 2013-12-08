Code5280::Application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :concerts, only: [:index]
  end
  root to: 'home#index'
  get '*page' => "home#index"
end
