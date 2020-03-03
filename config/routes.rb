Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/olympians', to: 'olympian#index'
      get '/olympian_stats', to: 'olympian#show'
      get '/events', to: 'events#index'
    end
  end
end
