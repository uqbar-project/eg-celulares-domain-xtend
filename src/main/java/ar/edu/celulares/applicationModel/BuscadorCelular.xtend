package ar.edu.celulares.applicationModel

import ar.edu.celulares.domain.Celular
import ar.edu.celulares.repo.RepoCelulares
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

/**
 * Application model que representa la búsqueda de {@link Celular}.
 * Contiene:
 * <ul>
 * 	<li>El estado de los atributos por los cuales buscar: numero y nombre</li>
 *  <li>El comportamiento para realizar la búsqueda (en realidad delega en otros objetos)</li>
 *  <li>El estado del resultado de la búsqueda, es decir que recuerda la lista de Celulares resultado</li>
 *  <li>El estado de la selección de un Celular para poder utilizar el comportamiento que sigue...</li>
 *  <li>Comportamiento para eliminar un Celular seleccionado.</li>
 * </ul>
 *
 * Este es un objeto transiente, que contiene estado de la ejecución para un usuario en particular
 * en una ejecución de la aplicación en particular.
 *
 * @author npasserini
 */
@Accessors
@Observable
class BuscadorCelular {

	Celular example = new Celular
	List<Celular> resultados
	Celular celularSeleccionado

	// ********************************************************
	// ** Acciones
	// ********************************************************
	def void search() {
		resultados = repoCelulares.search(example.numero, example.nombre)
	}

	def void clear() {
		example = new Celular
		resultados = newArrayList
		celularSeleccionado = null
	}

	def void eliminarCelularSeleccionado() {
		getRepoCelulares().delete(celularSeleccionado)
		this.search()
		celularSeleccionado = null
	}
	
	def crearCelular(Celular celular) {
		repoCelulares.create(celular)
		search
	}

	
	def actualizarSeleccionado() {
		repoCelulares.update(celularSeleccionado)
	}

	def RepoCelulares getRepoCelulares() {
		ApplicationContext.instance.getSingleton(typeof(Celular))
	}
}
