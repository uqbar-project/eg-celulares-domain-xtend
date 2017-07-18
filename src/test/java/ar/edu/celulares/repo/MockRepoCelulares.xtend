package ar.edu.celulares.repo

import ar.edu.celulares.domain.Celular
import ar.edu.celulares.domain.Modelo
import java.math.BigDecimal

class MockRepoCelulares extends RepoCelulares {

	new() {
		var celular = new Celular => [
			nombre = "Ricardo Ruben"
			numero = 44667816
			modeloCelular = new Modelo => [
				descripcion = "NOKIA LUMIA 625"
				costo = new BigDecimal(21.50)
				requiereResumenCuenta = false
			]
			recibeResumenCuenta = false
		]
		this.create(celular)
	}

}
