Rails.application.routes.draw do
  resources :pontes
  resources :ferrovia
  resources :lagos
  resources :edificacaos
  resources :logradouros
  resources :rios
  resources :quadras
  get 'quadras/new'

  post 'quadras/create'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
