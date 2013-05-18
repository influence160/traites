import com.traites.domain.*

class BootStrap {
	int nbrClients = 5;
	int maxTraites = 10;
	def articles = ["Frigider", "Gaz", "Matela" ];
    def init = { servletContext ->
		if(!Client.count()){
			Carnet carnet = new Carnet(numero: "100").save(failOnError: true, flush:true)
			
			nbrClients.times  {
				Client client = new Client(nom: "nom"+(it+1), prenom: "prenom"+(it+1))
				client = client.save(failOnError: true, flush:true)
				int nbrTraites = Math.floor(Math.random()*maxTraites) + 1
				def art = articles.get((int)Math.floor(Math.random()*3))
				SerieDeTraites serie = new SerieDeTraites(articleAchete: art)
				serie.client = client
				client.serieDeTraites = [serie]
				serie.carnet = carnet
				serie = serie.save(failOnError: true, flush:true)
				client = client.save(failOnError: true, flush:true)
				Calendar c = Calendar.getInstance();
				List traites = []
				nbrTraites.times {
					Date date = c.getTime();
					Traite t = new Traite(numero: it+1, montant: 50, echeance: date)
					t.serieDeTraites = serie
					t = t.save(failOnError: true, flush:true)
					c.add(Calendar.MONTH, 1);
					traites << t
				}
				//serie.traites = traites
				//serie.merge(failOnError: true, flush:true)
			}
		}
    }
    def destroy = {
    }
}
