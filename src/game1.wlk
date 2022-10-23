import wollok.game.*
object f14 {
	var property image = "aviondeguerra.png"
	var property position = game.origin()
	var vidas=1
	method image() = "aviondeguerra2.png"
	method disparar()= self.image()
}

object her {
	var property image = "refuerzo.png"
	var property position = game.origin()
	
	
}

	
object enemigo {
	var property position = game.center()
  method image() = "avene4.png"
  method position() = game.center()
  method movete() {
    const x = 0.randomUpTo(game.width()).truncate(0)
    const y = 0.randomUpTo(game.height()).truncate(0)
    position = game.at(x,y) 
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