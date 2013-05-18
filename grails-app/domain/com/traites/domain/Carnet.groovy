package com.traites.domain

class Carnet {
	
	String numero
	//Transient
	Float montantTotal
	Float montantPaye
	Float resteAPayer
	
	static hasMany = [seriesDeTraites: SerieDeTraites]
	static transients = ["montantTotal", "montantPaye", "resteAPayer"]
	
    static constraints = {
		numero nullable: false, blank: false, unique: true
    }
	
	
	static mapping = {
		
	}
	
	String toString(){
		return this.numero
	}
}
