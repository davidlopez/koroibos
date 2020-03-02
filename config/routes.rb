Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/olympians', to: 'olympian#index'
    end
  end
end
