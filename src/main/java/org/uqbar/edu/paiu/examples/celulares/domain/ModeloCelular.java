package org.uqbar.edu.paiu.examples.celulares.domain;
import java.math.BigDecimal;

import org.uqbar.commons.model.Entity;
import org.uqbar.commons.utils.TransactionalAndObservable;


@SuppressWarnings("serial")
@TransactionalAndObservable
public class ModeloCelular extends Entity {
	public static final String DESCRIPCION = "descripcion";
	
	private String descripcion;
	private BigDecimal costo;
	
	public ModeloCelular(String descripcion, double costo) {
		this.descripcion = descripcion;
		this.costo = new BigDecimal(costo);
	}
	
	public String getDescripcion() {
		return this.descripcion;
	}
	
	public String getDescripcionEntera() {
		return this.getDescripcion() + " ($ " + this.getCosto() + ")";
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public BigDecimal getCosto() {
		return this.costo;
	}
	
	public void setCosto(BigDecimal costo) {
		this.costo = costo;
	}
	
	@Override
	public String toString() {
		return this.getDescripcionEntera();
	}

}
