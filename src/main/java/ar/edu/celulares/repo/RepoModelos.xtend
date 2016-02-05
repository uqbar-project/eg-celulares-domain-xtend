package ar.edu.celulares.repo

import ar.edu.celulares.domain.Modelo
import java.math.BigDecimal
import java.util.List
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.utils.Observable

@Observable
class RepoModelos extends CollectionBasedRepo<Modelo> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def Modelo create(String unaDescripcion, float unCosto, boolean siRequiereResumenCuenta) {
		// guardamos la variable para devolverla al final
		val modelo = new Modelo => [
			descripcion = unaDescripcion
			costo = new BigDecimal(unCosto)
			requiereResumenCuenta = siRequiereResumenCuenta
		]
		this.create(modelo)
		modelo
	}

	def List<Modelo> getModelos() {
		allInstances	
	}
	
	def Modelo get(String descripcion) {
		modelos.findFirst [ modelo | modelo.descripcion.equals(descripcion) ]
	}

	override def Class<Modelo> getEntityType() {
		typeof(Modelo)
	}

	override def createExample() {
		new Modelo()
	}

	/**
	 * Esta definición no tiene utilidad dado que no usamos el search by example 
	 */
	override def Predicate<Modelo> getCriterio(Modelo example) {
		null
	}
	
}