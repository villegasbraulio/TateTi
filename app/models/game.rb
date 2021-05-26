class Game < ApplicationRecord


    def nuevo 
        @tableron = Array.new 9, ""
    end

   
   
    def tablerochange   
            ## poner elemento en el tablero, treer el anterior
            @tableron = Array.new 9, ""

        @tableron.delete (:posicion)
        @tableron.insert(:posicion, :simbolo)

    
    end



end
