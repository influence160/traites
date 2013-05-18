package com.traites.domain

import java.util.Date;

class Payement {
	
	float montant
	Date datePayement
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [traite: Traite]

    static constraints = {
		montant scale: 3, nullable: false, min: 0f, notEqual: 0f
    }
	
	static mapping = {
		autoTimestamp true
	}
	
	String toString(){
		return montant
	}
}
