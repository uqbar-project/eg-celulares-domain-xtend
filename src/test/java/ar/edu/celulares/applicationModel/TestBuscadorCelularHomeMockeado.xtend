package ar.edu.celulares.applicationModel

import ar.edu.celulares.domain.Celular
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.celulares.home.MockRepoCelulares

class TestBuscadorCelularHomeMockeado extends AbstractTestBuscadorCelular {

	@Before
	override void init() {
		super.init
		ApplicationContext.instance.configureSingleton(typeof(Celular), new MockRepoCelulares)
	}

	@Test
	def void buscarDodinosEnMockHome() {
		searcher.search
		Assert.assertEquals(0, searcher.resultados.size)
	}

	@Test
	def void buscarRicardoRubenEnMockHome() {
		var buscadorRicardoRuben = new BuscadorCelular
		buscadorRicardoRuben.example.nombre = "Ricardo"
		buscadorRicardoRuben.search
		Assert.assertEquals(1, buscadorRicardoRuben.resultados.size)
	}

}
