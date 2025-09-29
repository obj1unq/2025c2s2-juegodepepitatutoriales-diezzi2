import extras.*

// PEPITA

object pepita {
	var energia           = 500
	var property position = game.origin()
	var predador          = silvestre
	var objetivo          = nido

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method estadoActual() {
		return if (self.atrapadaPorSilvestre() or self.estaAgotada()) {
			failState.nombre()
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
		return energia == 0
	}

	method image() {
		return "pepita" + self.estadoActual() + ".png"
	}

	method caer() {
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