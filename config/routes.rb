Rails.application.routes.draw do
  resources :musics
  root "pages#hello"
  get "about", to: "pages#about"
  resources :users

  post '/login' ,to:'login#create'
  post '/logout' ,to: 'login#destroy'
end