package hibernate

class NamedQueries {
	/*	SERIE DE TRAITES	*/
	static final String SERIE_DE_TRAITES_NOMBRE_DE_TRAITES = """select count(t) from SerieDeTraites s, Traite t 
													  where t.serieDeTraites = s and s.id = :id"""
	static final String SERIE_DE_TRAITES_MONTANT = """select SUM(t.montant) from SerieDeTraites s, Traite t 
									  where t.serieDeTraites = s and s.id = :id"""
	static final String SERIE_DE_TRAITES_MONTANT_PAYE = """select SUM(p.montant) from SerieDeTraites s, Traite t, Payement p
									  where t.serieDeTraites = s and p.traite = t and s.id = :id"""
	
									  
  static final String TRAITE_MONTANT_TOTAL = """select SUM(t.montant) from SerieDeTraites s, Traite t
								where t.serieDeTraites = s and s.id = :id"""
  static final String TRAITE_MONTANT_PAYE = """select SUM(p.montant) from SerieDeTraites s, Traite t, Payement p
								where t.serieDeTraites = s and p.traite = t and s.id = :id"""
	
}
