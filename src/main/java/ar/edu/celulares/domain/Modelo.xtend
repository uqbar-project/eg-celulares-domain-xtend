package ar.edu.celulares.domain

import java.math.BigDecimal
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Modelo extends Entity {
	String descripcion
	BigDecimal costo
	Boolean requiereResumenCuenta // FED: boolean tiene problemas

	def getDescripcionEntera() {
		descripcion.concat(" ($ ").concat(costo.toString).concat(")")
	}

	override def toString() {
		descripcionEntera
	}
}
