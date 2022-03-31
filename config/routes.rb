Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/coaches', to: 'coaches#index'
  get '/coaches/:id/edit', to: 'coaches#edit'
  get '/coaches/new', to: 'coaches#new'
  post '/coaches', to: 'coaches#create'
  get '/coaches/:id', to: 'coaches#show'
  patch '/coaches/:id', to: 'coaches#update'
  delete '/coaches/:id', to: 'coaches#destroy'

  get '/coaches/:coach_id/athletes', to: 'coach_athletes#index'
  get '/coaches/:coach_id/athletes/new', to: 'coach_athletes#new'
  post '/coaches/:coach_id/athletes', to: 'coach_athletes#create'

  get '/athletes', to: 'athletes#index'
  get '/athletes/:id', to: 'athletes#show'
  get '/athletes/:id/edit', to: 'athletes#edit'
  patch '/athletes/:id', to: 'athletes#update'
  delete '/athletes/:id', to: 'athletes#destroy'


end
