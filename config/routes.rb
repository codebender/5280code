Code5280::Application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :fitbit do
      resource :user, only: :show
      resource :device, only: :show
      get 'activity(/:time_frame)' => 'activities#show'
      get 'sleep(/:time_frame)' => 'sleeps#show'
    end

    namespace :bitcoin do
      resource :ticker, only: :show
    end

    resources :meetups, only: :index

    resources :blog_posts, only: [ :index, :show ]
  end
  root to: 'home#index'
  get '*page' => "home#index"
end
