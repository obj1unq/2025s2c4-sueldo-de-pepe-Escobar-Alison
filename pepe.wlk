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

object sofia {
  var categoria = cadete
  var tipoBonoResultados = bonoPorcentaje

  method sueldo() = self.neto() + self.bonoResultados()

  method neto() = categoria.neto() * 1.3

  method bonoResultados() = tipoBonoResultados.bono(self)
  
  method categoria(_categoria) {
    categoria = _categoria
  }
  
  method tipoBonoResultados(_tipoBonoResultados) {
    tipoBonoResultados = _tipoBonoResultados
  }
}

object roque {
  const property neto = 28000
  var tipoBonoResultados = bonoPorcentaje

  method sueldo() = self.neto() + self.bonoResultados() + 9000

  method bonoResultados() = tipoBonoResultados.bono(self)

  method tipoBonoResultados(_tipoBonoResultados) {
    tipoBonoResultados = _tipoBonoResultados
  }
}

object ernesto {
  var compa = pepe
  var tipoBonoPresentismo = bonoNormal
  const property faltas = 0 //como es const solo tendrá getter

  method sueldo() = self.neto() + self.bonoPresentismo()

  method neto() = compa.neto() 
  
  method bonoPresentismo() = tipoBonoPresentismo.bono(self)

  method compa(_compa){
    compa = _compa
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

object vendedor {
  var muchasVentas = false

  method neto() = 
    if (muchasVentas) {
      16000 * 1.25
    } else 16000
  
  method activarAumentoPorMuchasVentas() {
    muchasVentas = true
  }

  method desactivarAumentoPorMuchasVentas() {
    muchasVentas = false
  }
}

object medioTiempo {
  var property categoriaBase = cadete
  
  method categoriaBase(_categoria) {
    categoriaBase = _categoria
  }

  method neto() = categoriaBase.neto() / 2
}

// ---- Bonos por resultados ------------
object bonoPorcentaje {
  method bono(empleado) = empleado.neto() * (10/100)
}

object bonoMontoFijo {
  method bono(empleado) = 800 
}

object bonoNulo{
  method bono(empleado) = 0
}

// ---- Bonos por presentismo -------------
object bonoNormal {
  method bono(empleado) =
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