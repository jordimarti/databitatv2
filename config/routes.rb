Rails.application.routes.draw do
  resources :ents
  get 'ents/:id/coverage', to: 'ents#coverage', as: 'ents_coverage'
  get 'ents/:id/timelapses', to: 'ents#timelapses', as: 'ents_timelapses'
  get 'ents/:id/photos', to: 'ents#photos', as: 'ents_photos'
  get 'home/index'
  get 'home/index2'
  root to: "home#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
