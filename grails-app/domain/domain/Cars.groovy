package domain

class Cars {
	enum Carburant{
		Essence, Diesel, Electrique
	}
	
	enum Marque{
		Peugeot, Renault, Citroen, Mercedes, Ferrari
	}
		Marque marque
		Carburant type_carburant
		
    static constraints = {
		marque(blank:false, maxSize:100)
		type_carburant(blank:false, maxSize:50)
    }
	
	String toString(){
		"${ marque }"
	}
}
