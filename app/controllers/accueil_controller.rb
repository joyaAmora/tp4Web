#Jade Phaneuf
#2020-11-19
class AccueilController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    layout "general"

    def index
        @recettes = Recette.all
    end

    def presentation
        @recettes = Recette.all
    end

    def mesrecettes
        @recettes = current_user.recettes
        render 'accueil/mesrecettes'
    end

end