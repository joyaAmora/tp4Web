#Jade Phaneuf
#2020-11-19
class MesRecettesController < ApplicationController
    @recettes = Recette.all
end