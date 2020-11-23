#Jade Phaneuf
#2020-11-19
Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'accueil#presentation'
  get 'mesrecettes', to: 'accueil#mesrecettes'
  get 'recette/:id', to: 'recette#show_1'

  namespace :admin do
    get '/recette', to: 'users#recettes_admin'
    get '/recette/:id', to: 'users#recette_detail_admin'
  end
end
