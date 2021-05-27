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
    game.lastplay = "U"

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

    if  game.lastplay == symbol 
    return
    else game.lastplay = symbol
    end
 
    
 ## no deja poner 2 en el mismo casillero

    if toblerone [posicion] == ""
    toblerone [posicion] = symbol
    else
    return 
    end
    game.tablero = toblerone
    game.save
    render json: game

    
    
end

def game_params
    params.permit :name
end

def board_params
    params.permit :simbolo, :posicion
end



end
