import wollok.game.*

object juego {
	method iniciar() {
		keyboard.space().onPressDo({
			f14.dispara()
		})
		// límites del juego
	game.width(20)
	game.height(20)
	game.title("f14!")
	
	// fondo
	game.boardGround("mar.png")
	game.addVisualCharacter(f14)
	game.addVisual(enemigo)
	enemigo. perseguirAF14()
	
	  
}

}		
object f14 {
	var puntos = 0
	var property image = "aviondeguerra.png"
	var property position = game.origin()
	var vidas=1
	
	method dispara(){
		const aviondeguerra2 = new misil(position = position.right(1))
		game.addVisual(aviondeguerra2)
		aviondeguerra2.desplazarse()
		
	}
	
}
class misil {
	var position
	method image() = "aviondeguerra2.png"
	
	method position() = position
	
	method desplazarse(){
		game.onCollideDo(self,{algo=>algo.teChocoLaBola()})
		game.onTick(250,"aviondeguerra2",{self.moverseDerecha()})
	}
	method moverseDerecha() {
		position = position.right(1)
		if(position.x() > game.width()){
			game.removeTickEvent("aviondeguerra2")
			game.removeVisual(self)
		}
	}
method teChocoLaBola(){
		self.disminuirPuntos()
	}
	
	method disminuirPuntos() {
		puntos = puntos - 100 
	}
	}
object her {
	var property image = "refuerzo.png"
	var property position = game.origin()
	
	
}

	
object enemigo {
	var property position = game.center()
  method image() = "avene4.png"
  
  method perseguirAF14(){
		game.onTick(1000,"acercarse",{self.darUnPaso(f14.position())})
	}
	
	method darUnPaso(destino){
		position = game.at(
			position.x() + (destino.x()-position.x())/2,
			position.y() + (destino.y()- position.y())/2
		)
	}
	method aparecer(){
		
		game.addVisual(self)
		self.perseguirAF14()
		
		}
	
  
  method teChocoLaBola(){
		self.desaparecer()
	}
method desaparecer() {
		if(game.hasVisual(self)){
			game.removeVisual(self)
		    game.removeTickEvent("acercarse")
		}
	}
}
object norte{
	method posicion(pos){return
		if(pos.y()!=game.height()-1) pos.up(1)
		else new Position(x=pos.x(),y=0)
	}
}

object sur{
	method posicion(pos){return
		if(pos.y()!=0) pos.down(1)
		else new Position(x=pos.x(),y=game.height()-1)
	}
}

object este{
	method posicion(pos){return
		if(pos.x()!=game.width()-1) pos.right(1)
		else new Position(x=0,y=pos.y())
	}
}

object oeste{
	method posicion(pos){return
		if(pos.x()!=game.height()-1) pos.left(1)
		else new Position(x=game.width()-1,y=pos.y())
	}}