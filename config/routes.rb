Code5280::Application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :fitbit do
      resource :user, only: :show
      resource :device, only: :show
      resource :activity, only: :show
      resource :sleep, only: :show
    end

    namespace :bitcoin do
      resource :ticker, only: :show
    end

    resources :meetups, only: :index
  end
  root to: 'home#index'
  get '*page' => "home#index"
end
