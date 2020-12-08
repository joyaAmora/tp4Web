#Jade Phaneuf
#2020-11-04
class Admin::UsersController < AdminController
    def admin
    end

    def recettes_admin
        @users = User.left_joins(:recettes).where.not(recettes: { id: nil }).distinct  
        respond_to do |format|
            format.html
            format.json {render :json => @recette.ingredients.to_json}
            format.xml {render :xml => @recette.ingredients.to_xml}
        end  
    end

    def recette_detail_admin
        @recette = Recette.find(params[:id])
        @user = current_user
        respond_to do |format|
            format.html
            format.json {render :json => @recette.ingredients.to_json}
            format.xml {render :xml => @recette.ingredients.to_xml}
        end
    end

end