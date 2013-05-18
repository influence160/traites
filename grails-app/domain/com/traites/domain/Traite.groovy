package com.traites.domain

import java.util.Date;

class Traite {
	
	short numero
	float montant
	Date echeance
	String notes
	boolean paye = false
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [serieDeTraites: SerieDeTraites]
	static hasMany = [payements: Payement]

    static constraints = {
		montant scale: 3, nullable: false, min: 0f, notEqual: 0f
		echeance format: "yyyy-MM-dd", nullable: true;
		notes nullable: true, maxSize: 1000
		
    }
	
	static mapping = {
		autoTimestamp true
		payements cascade: "all-delete-orphan"
	}
	
	def beforeUpdate = {
		def _mtPaye = getMontantPaye()
		if(_mtPaye >= montant){
			this.paye = true
			if(_mtPaye > montant)
				log.warn("Montant payé supérieur au montant pour la traite Numéro " + id);
		}
	}
	
	static namedQueries = {
	   traitesBySerie { serie ->
			eq 'serieDeTraites', serie
	   }
	   
	   montantsBySerie { serie ->
			eq 'serieDeTraites', serie
			return montant
	   }
	}
	
	Float getMontantPaye(){
		return this.payements.montant.sum()
	}
}
