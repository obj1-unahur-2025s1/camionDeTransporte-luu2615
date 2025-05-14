import cosas.*
object camion {
    var cosasCargadas = []
    var peso = 1000 + cosasCargadas.sum(cosasCargadas.map({cosa => cosa.peso()}))
    method cargar(cosa) {
      cosasCargadas.add(cosa)
    }
    method descargar(cosa) {
      cosasCargadas.remove(cosa)
    }
    method pesoTotal() = peso
    method sonTodasCosasCargadasPares() = cosasCargadas.all({cosa => cosa.peligrosidad() % 2 == 0})
    method primeraCosaCargadaConNivelDePeligrosidad() = cosasCargadas.filter({cosa => cosa.peligrosidad() > 0}).first()
    method listaPeligrosidadDeNivelMasAltoA_(nivel) = cosasCargadas.filter({cosa => cosa.peligrosidad() > nivel})
    method listaPeligrosidadMasAltaACosa_(cosaAComparar) = cosasCargadas.filter({cosa => cosa.peligrosidad() > cosaAComparar.peligrosidad()})
    method excedePesoMaximo() = peso > 2500
    method puedeCircularRuta(peligrosidadDelViaje) = not self.excedePesoMaximo() && not self.listaPeligrosidadDeNivelMasAltoA_(peligrosidadDelViaje).isEmpty()
    method cosaEntre(minimo,maximo) =  cosasCargadas.any({cosa => cosa.peso() > minimo && cosa.peso() < maximo})
    method masPesada() = cosasCargadas.max() 
}