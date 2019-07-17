Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }  do
    namespace :v1 do
      resources :movies, only: [:create, :index]
      get 'movie_functions/:date', to: 'movie_functions#by_date'
      resources :reservations, only: [:create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
