object pepe {    
  var property categoria = cadete
	var property tipoBonoResultados = bonoPorcentaje
  var property tipoBonoPresentismo = bonoNomal
  var property faltas = 0   //situaciónDeFaltas?

  method sueldo() = self.neto() + self.bonoResultados() + self.bonoPresentismo()

  method neto() = categoria.neto()

  method bonoResultados() = tipoBonoResultados.bono(self) //duda
    
  method bonoPresentismo() = tipoBonoPresentismo.bono(self) //duda
}

// ---- Categorías ---------------------
object gerente {
  method neto() = 15000
}

object cadete {
  method neto() = 20000
}

// ---- Bonos por resultados ------------
object bonoPorcentaje {
  method bono(empleado) = empleado.neto() * (10/100)
}

object bonoMonto {
  method bono() = 800 
}

object bonoNulo{
  method bono() = 0 //neutro de la suma
}

// ---- Bonos por presentismo -------------
object bonoNomal {
  method bono(empleado) =                   // a mejorar
    if (empleado.cantDeFaltas() == 0) {
      2000
    } else if (empleado.cantDeFaltas() == 1) {
      1000
    } else {
      0
    }
}

object bonoAjuste {
  method bono(empleado) = 
    if (empleado.cantDeFaltas() == 0) 100 else 0
}

object bonoDemagogico {
  method bono(empleado) = 
    if (empleado.neto() < 18000) 500 else 300
}