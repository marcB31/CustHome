package domain

class Reservation {
	Date dateReservation
	int cars_id
	int customer_id
    static constraints = {
		
    }
	def beforeInsert={
		//dateReservation=new Date()
	}
	static hasMany = [cars:Cars]
}
