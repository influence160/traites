package com.traites.domain

import hibernate.NamedQueries;

import java.util.Date;

class SerieDeTraites {

	String articleAchete
	String notes
	
	Date dateCreated
	Date lastUpdated
		
	static hasMany = [traites:Traite]
	static belongsTo = [client: Client, carnet: Carnet]
	static transients = ["nombreDeTraites", "montant"]
	
	static constraints = {
		articleAchete nullable: true
		notes nullable: true, maxSize: 1000
    }
	
	static mapping = {
		autoTimestamp true
		traites cascade: "all-delete-orphan"
	}
	
//	static namedQueries = {
//       nqNombreDeTraites {
//	   		eq 
//       }
//	}
	
	//TRANSIENT PROPS
	public short getNombreDeTraites(){
		return this.traites.size()
	}
	
	public Float getMontant(){
//		montant = this.traites.montant.sum()
		String query = NamedQueries.SERIE_DE_TRAITES_MONTANT
		return executeQuery(query, [id: id]).get(0)
	}
	
	public Float getMontantPaye(){
		String query = NamedQueries.SERIE_DE_TRAITES_MONTANT_PAYE
		return executeQuery(query, [id: this.id]).get(0)
	}
	
	public Float getResteAPayer(){
		return getMontant() - getMontantPaye()
	}
}
