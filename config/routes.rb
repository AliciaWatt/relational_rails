Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/coaches', to: 'coaches#index'
  get '/coaches/:id', to: 'coaches#show'
  get '/athletes', to: 'athletes#index'
  get '/athletes/:id', to: 'athletes#show'

end
