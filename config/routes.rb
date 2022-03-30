Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/coaches', to: 'coaches#index'
  get '/coaches/new', to: 'coaches#new'
  get '/coaches/:id', to: 'coaches#show'
  get '/coaches/:coach_id/athletes', to: 'coach_athletes#index'
  get '/athletes', to: 'athletes#index'
  get '/athletes/:id', to: 'athletes#show'
  post '/coaches', to: 'coaches#create'

end
