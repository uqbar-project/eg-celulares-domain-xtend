package ar.edu.celulares.applicationModel

import ar.edu.celulares.domain.Modelo
import ar.edu.celulares.repo.RepoModelos
import org.junit.Before
import org.uqbar.commons.applicationContext.ApplicationContext

class AbstractTestBuscadorCelular {

	protected BuscadorCelular searcher

	@Before
	def void init() {
		searcher = new BuscadorCelular
		searcher.example.nombre = "Dodi"
		ApplicationContext.instance.configureSingleton(typeof(Modelo), new RepoModelos)
	}

}
