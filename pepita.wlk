import extras.*

// PEPITA

object pepita {
	var energia           = 100
	var property position = game.at(0,1)
	var property estado   = volando
	var predador          = silvestre

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	method atrapadaPorSilvestre() {
		return self.position() == predador.position()
	}

	method image() {
		return "pepita" + estado.nombre() + ".png"
	}

}

// ESTADOS DE PEPITA

object ganadora {
  	method nombre() {
		return "Ganadora"
  	}
}

object volando {
	method nombre() {
		return "Volando"
  	}
}

object muerta {
	method nombre() {
		return "Muerta"
  	}
}