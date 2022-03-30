Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/coaches', to: 'coaches#index'
  get '/coaches/new', to: 'coaches#new'
  get '/coaches/:id', to: 'coaches#show'
  get '/coaches/:id/edit', to: 'coaches#edit'
  get '/athletes', to: 'athletes#index'
  get '/athletes/:id', to: 'athletes#show'
  get '/coaches/:coach_id/athletes', to: 'coach_athletes#index'
  get '/coaches/:coach_id/athletes/new', to: 'coach_athletes#new'
  get '/athletes/:id/edit', to: 'athletes#edit'
  

  post '/coaches', to: 'coaches#create'
  patch '/coaches/:id', to: 'coaches#update'

  post '/coaches/:coach_id/athletes', to: 'coach_athletes#create'
  patch '/athletes/:id', to: 'athletes#update'


end
