object knightRider {
    var property peso = 500
    var property peligrosidad = 10 
}
object bumblebee {
    var property peso = 800
    var property peligrosidad = if(self.esAuto()) 15 else 30
    method esAuto() = false 
}
object paqueteLadrillos {
    var property cantidad = 100
    var property peso = cantidad * 2
    var property peligrosidad = 2
}
object arenaAGranel {
    var property peso = 100
    var property peligrosidad = 1 
}
object bateriaAntiAerea {
    var property peso = if(self.tieneMisiles()) 300 else 200
    var property peligrosidad = if(self.tieneMisiles()) 100 else 0
    method tieneMisiles() = false
}
object contenedorPortuario {
    var cosasGuardadas = []
    var property peso = 100 + cosasGuardadas.sum(cosasGuardadas.map({cosa => cosa.peso()}))
    var property peligrosidad = if (not self.tieneCosas()) 0 else cosasGuardadas.filter({cosa => cosa.peligrosidad() > 0}).max()
    method tieneCosas() = not cosasGuardadas.isEmpty()
}
object embalajeSeguridad {
    var property cosaEnvuelta = null
    var property peso = cosaEnvuelta.peso()
    var property peligrosidad = cosaEnvuelta / 2
    method envolver(cosa) {
      cosaEnvuelta = cosa
    }
}