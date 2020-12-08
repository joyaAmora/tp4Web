#Jade Phaneuf
#2020-12-08
Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'accueil#index'
  get 'mesrecettes', to: 'accueil#mesrecettes'
  get 'recette/:id', to: 'recette#detailRecette'
  get 'ajoutRecette', to: 'recette#ajoutRecette'
  resources :recette

  namespace :admin do
    get '/recette', to: 'users#recettes_admin'
    get '/recette/:id', to: 'users#recette_detail_admin'
  end
end
