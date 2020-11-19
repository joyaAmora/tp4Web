#Jade Phaneuf
#2020-11-19
class AccueilController < ApplicationController
    before_action :authenticate_user!, except: [:presentation]
    layout "application"

    def presentation
        @recettes = Recette.all
    end

    def mesRecettes
        @currentUser = current_user
        @mesRecettes = Recette.where(:user_id => @current_user.id)
        render 'mesrecettes'
    end
end