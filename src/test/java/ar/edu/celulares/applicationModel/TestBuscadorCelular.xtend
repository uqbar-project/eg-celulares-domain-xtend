package ar.edu.celulares.applicationModel

import ar.edu.celulares.domain.Celular
import ar.edu.celulares.domain.Modelo
import ar.edu.celulares.repo.RepoCelulares
import ar.edu.celulares.repo.RepoModelos
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.commons.applicationContext.ApplicationContext

class TestBuscadorCelular extends AbstractTestBuscadorCelular {

	BuscadorCelular buscadorFallido
	
	@Before
	override void init() {
		super.init()

		ApplicationContext.instance.configureSingleton(typeof(Celular), new RepoCelulares)

		/**
		 * Copiado del CelularesBootstrap, ahora no tiene
		 * tanto sentido este test porque no hay init
		 * donde se inicia el fixture
		 */
		val repoModelos = ApplicationContext.instance.getSingleton(typeof(Modelo)) as RepoModelos
		val repoCelulares = ApplicationContext.instance.getSingleton(typeof(Celular)) as RepoCelulares

		val nokiaAsha = repoModelos.create("NOKIA ASHA 501", 700f, true)
		val lgOptimusL5 = repoModelos.create("LG OPTIMUS L5 II", 920f, false)
		repoModelos.create("LG OPTIMUS L3 II", 450f, true)
		val nokiaLumia = repoModelos.create("NOKIA LUMIA 625", 350f, true)
		repoModelos.create("MOTOROLA RAZR V3", 350f, false)

		repoCelulares.create("Laura Iturbe", 88022202, nokiaLumia, false)
		repoCelulares.create("Julieta Passerini", 45636453, nokiaAsha, false)
		repoCelulares.create("Debora Fortini", 45610892, nokiaAsha, true)
		repoCelulares.create("Chiara Dodino", 68026976, nokiaAsha, false)
		repoCelulares.create("Melina Dodino", 40989911, lgOptimusL5, true)
		
		buscadorFallido = new BuscadorCelular
		buscadorFallido.example.nombre = "XXXX"
	}

	@Test
	def void buscarSinResultados() {
		buscadorFallido.search
		Assert.assertEquals(0, buscadorFallido.resultados.size)
	}
	
	@Test
	def void buscarDodinos() {
		searcher.search
		Assert.assertEquals(2, searcher.resultados.size)
	}

	@Test
	def void buscarDodinosConNumeroErroneo() {
		searcher.example.numero = 17715274
		searcher.search
		Assert.assertEquals(0, searcher.resultados.size)
	}

}
