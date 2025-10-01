import extras.*

// PEPITA

object pepita {
	var energia           = 500
	var property position = game.origin()
	var predador          = silvestre
	var objetivo          = nido

	// métodos dados

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	// estados

	method estadoActual() {
		return if (self.atrapadaPorSilvestre() or self.estaAgotada()) {
			failState.nombre()
			game.stop()
		}
		else if (self.llegoAlObjetivo()) {
			winState.nombre()
		}
		else flightState.nombre()
	}

	method llegoAlObjetivo() {
		return self.position() == objetivo.position()
	}

	method atrapadaPorSilvestre() {
		return self.position() == predador.position()
	}

	method estaAgotada() {
		return energia < 9
	}

	method image() {
		return "pepita" + self.estadoActual() + ".png"
	}

	// gravedad

	method caer() {
		self.moverAbajo()
	}

	// vuelo con gasto de energía

	method volarIzquierda() {
			energia -= 9
			self.moverIzquierda()
	}

	method volarDerecha() {
		energia -= 9
	 	self.moverDerecha()
	}
	
	method volarArriba() {
		energia -= 9
	  	self.moverArriba()
	}
	
	method volarAbajo() {
		energia -= 9
	  	self.moverAbajo()
	}

	// movimiento genérico

	method moverIzquierda() {
		position = game.at(0.max(position.x() - 1), position.y())
	}

	method moverDerecha() {
	 	position = game.at((game.width() - 1).min(position.x() + 1), position.y())
	}
	
	method moverArriba() {
	  	position = game.at(position.x(), (game.height() - 1).min(position.y() + 1))
	}
	
	method moverAbajo() {
	  	position = game.at(position.x(), 0.max(position.y() - 1))
	}
}

// ESTADOS DE PEPITA

object winState {
  	method nombre() {
		return "Win"
  	}
}

object flightState {
	method nombre() {
		return "Flight"
  	}
}

object failState {
	method nombre() {
		return "Fail"
  	}
}