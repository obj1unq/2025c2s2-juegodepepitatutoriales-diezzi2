import pepita.*

object silvestre {
    var presa = pepita

    method position() {
        return game.at(3.max(presa.position().x()),0)
    }

    method image() {
        return "silvestre.png"
    }

}

object nido {
    var property position = game.center()

    method image() {
        return "nido.png"
    }

}