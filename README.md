# README

rails db:drop
rails db:create
rails db:migrate

rails s

* Crear nuevo jugador
* POST http://127.0.0.1:3000/user body: {"name" : "braulio"}

* Crear nuevo juego
* POST http://127.0.0.1:3000/game body : {"name" : "juego 1"}

* Realizar movimiento
* PUT http://127.0.0.1:3000/game/1 {"posicion" : 5, "simbolo" : "X"} 

* Mostrar movimientos
* http://127.0.0.1:3000/game

* Mostrar movimiento especifico
* http://127.0.0.1:3000/game/3

