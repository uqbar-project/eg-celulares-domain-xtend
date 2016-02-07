package ar.edu.celulares.repo

import ar.edu.celulares.domain.Celular
import ar.edu.celulares.domain.Modelo
import ar.edu.celulares.repo.RepoCelulares
import java.math.BigDecimal

class MockRepoCelulares extends RepoCelulares {

	new() {
		var celular = new Celular
		celular.nombre = "Ricardo Ruben"
		celular.numero = 44667816
		celular.modeloCelular = new Modelo => [
			descripcion = "NOKIA LUMIA 625"
			costo = new BigDecimal(21.50)
			requiereResumenCuenta = false			
		]
		celular.recibeResumenCuenta = false
		this.create(celular)
	}
	
}
