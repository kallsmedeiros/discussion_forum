Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'home'
  get '/:id', to: 'home#show', as: 'home_show'
  post '/forum_threads/', to: 'forum_threads#create', as: 'forum_threads'
  # route 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
