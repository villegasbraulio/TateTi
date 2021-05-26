class GameController < ApplicationController
    skip_before_action :verify_authenticity_token



#GET /game
def index 

    game = Game.all
    render json: game

end

def show 

    @game = Game.find (params[:id])
    render json: @game

end

def create   

    game = Game.create (game_params) 
    game.tablero = Array.new 9,""

    if game.save
    render json: game
    else
    render game.errors.full_message
    end
        

end

def update
    game = Game.find (params[:id])

    json = JSON.parse request.body.read
    symbol = json ["simbolo"]
    posicion = json ["posicion"] 
    toblerone = JSON.parse (game.tablero)  ##copia del array que tengo en string

    toblerone [posicion] = symbol
    game.tablero = toblerone
    game.save
    render json: game
    #if game.update game_params
    
    #game.tablerochange 
    #render json: game.tablerochange
    #else
    #render game.errors.full_message
    #end


    # ##como ir a modificar el arreglo

end

def game_params
    params.permit :name
end

def board_params
    params.permit :simbolo, :posicion
end



end
