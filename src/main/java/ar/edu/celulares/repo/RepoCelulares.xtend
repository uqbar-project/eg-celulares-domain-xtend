package ar.edu.celulares.repo

import ar.edu.celulares.domain.Celular
import ar.edu.celulares.domain.Modelo
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException

@Observable
class RepoCelulares extends CollectionBasedRepo<Celular> {

	// ********************************************************
	// ** Altas y bajas
	// ********************************************************
	def void create(String pNombre, Integer pNumero, Modelo pModeloCelular, Boolean pRecibeResumenCuenta) {
		this.create(new Celular => [
			nombre = pNombre
			numero = pNumero
			modeloCelular = pModeloCelular
			recibeResumenCuenta = pRecibeResumenCuenta
		])
	}

	override void validateCreate(Celular celular) {
		celular.validar()
		validarClientesDuplicados(celular)
	}

	/**
	 * Valida que no haya dos clientes con el mismo número de celular
	 */
	def void validarClientesDuplicados(Celular celular) {
		val numero = celular.numero
		if (!this.search(numero).isEmpty) {
			throw new UserException("Ya existe un celular con el número: " + numero)
		}
	}

	// ********************************************************
	// ** Búsquedas
	// ********************************************************
	def search(Integer numero) {
		this.search(numero, null)
	}

	/**
	 * Busca los celulares que coincidan con los datos recibidos. Tanto número como nombre pueden ser nulos,
	 * en ese caso no se filtra por ese atributo.
	 *
	 * Soporta búsquedas por substring, por ejemplo el celular (12345, "Juan Gonzalez") será contemplado por
	 * la búsqueda (23, "Gonza")
	 */
	def search(Integer numero, String nombre) {
		allInstances.filter[celular|this.match(numero, celular.numero) && this.match(nombre, celular.nombre)].toList
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}

	override def getEntityType() {
		typeof(Celular)
	}

	override def createExample() {
		new Celular
	}

	/**
	 * Esta definición no tiene utilidad dado que no usamos el search by example 
	 */
	override def Predicate<Celular> getCriterio(Celular example) {
		null
	}

	/**
	 * Para el proyecto web - se mantiene la busqueda por Identificador
	 */
	override def searchById(int id) {
		allInstances.findFirst[celular|celular.id.equals(id)]
	}

}
