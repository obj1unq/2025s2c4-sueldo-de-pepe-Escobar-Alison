object pepe {    
  var categoria = cadete
	var tipoBonoResultados = bonoPorcentaje
  var tipoBonoPresentismo = bonoNormal
  var property faltas = 0 

  method sueldo() = self.neto() + self.bonoResultados() + self.bonoPresentismo()

  method neto() = categoria.neto()

  method bonoResultados() = tipoBonoResultados.bono(self)
    
  method bonoPresentismo() = tipoBonoPresentismo.bono(self)

  method categoria(_categoria) {
    categoria = _categoria
  }

  method tipoBonoResultados(_tipoBonoResultados) {
    tipoBonoResultados = _tipoBonoResultados
  }

  method tipoBonoPresentismo(_tipoBonoPresentismo) {
    tipoBonoPresentismo = _tipoBonoPresentismo
  }
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

object bonoMontoFijo {
  method bono(empleado) = 800 
}

object bonoNulo{
  method bono(empleado) = 0 //neutro de la suma
}

// ---- Bonos por presentismo -------------
object bonoNormal {
  method bono(empleado) =                   // a mejorar
    if (empleado.faltas() == 0) {
      2000
    } else self.bonoCuandoTieneFaltas(empleado)


    method bonoCuandoTieneFaltas(empleado) =
      if (empleado.faltas() == 1) {
      1000
    } else 0

}

object bonoAjuste {
  method bono(empleado) = 
    if (empleado.faltas() == 0) 100 else 0
}

object bonoDemagogico {
  method bono(empleado) = 
    if (empleado.neto() < 18000) 500 else 300
}