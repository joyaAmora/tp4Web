#Jade Phaneuf
#2020-11-04
class AdminController < ApplicationController 
    before_action :authenticate_user!
    before_action :is_admin?

    private

    def is_admin?
        unless params[:is_admin] && params[:is_admin] == "oui"
            render html: "NOT AUTORIZED"
        end
    end
end