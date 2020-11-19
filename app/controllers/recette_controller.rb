#Jade Phaneuf
#2020-11-04
class RecetteController < ApplicationController
    before_action :authenticate_user!
    def show_1
        @recette = Recette.find(params[:id])    

        respond_to do |format|
            format.html
            format.json {render :json => @recette.ingredients.to_json}
            format.xml {render :xml => @recette.ingredients.as_json.to_xml}
        end
    end

end