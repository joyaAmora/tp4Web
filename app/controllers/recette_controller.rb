#Jade Phaneuf
#2020-11-04
class RecetteController < ApplicationController
    layout 'general'
    before_action :authenticate_user!
    def show_1
        @recette = Recette.find(params[:id])    

        respond_to do |format|
            format.html
            format.json {render :json => @recette.ingredients.to_json}
            format.xml {render :xml => @recette.ingredients.as_json.to_xml}
        end
    end

    def detailRecette
        @User = current_user
        @recettes = Recette.find(params[:id])    
        render 'accueil/recetteDetail' 
    end

    def ajoutRecette
        render 'accueil/ajoutRecette'
    end

    def create
        Recette.create(
            titre: params[:titre],
            etapes: params[:etapes],
            user: current_user,
            recette_ingredients:[
                RecetteIngredient.new({quantite: 4, ingredient: Ingredient.first}),
                RecetteIngredient.new({quantite: 2, ingredient: Ingredient.last}),]
        )
        redirect_to '/'
    end

    def edit
        @recette = Recette.find(params[:id])
    end

    def update
        @recette = Recette.find(params[:id])  
        if (@recette.update(params.require(:recette).permit(:titre, :etapes)))
            redirect_to @recette
        else
            render 'recettes/edit'
        end
    end

end