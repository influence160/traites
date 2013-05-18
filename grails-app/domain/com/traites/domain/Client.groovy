package com.traites.domain

import java.util.regex.Matcher;

class Client {
	String nom
	String prenom
	String cin
	String pere
	String grandPere
	String mari
	String adresse
	String telephone1
	String telephone2
	String notes
	
	static hasMany = [serieDeTraites: SerieDeTraites]

    static constraints = {
		nom blank: false
		prenom blank: false
		cin nullable: true
		pere nullable: true
		grandPere nullable: true
		mari nullable: true
		adresse nullable: true
		telephone1 nullable: true, matches: "([0-9]\\s)*"
		telephone2 nullable: true, matches: "([0-9]\\s)*"
		notes nullable: true, maxSize: 3000
    }
	
	static mapping = {
		
	}
	
	String toString(){
		return nom + " " + prenom
	}
}
