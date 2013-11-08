package domain

import javax.naming.directory.SearchResult;

import org.springframework.dao.DataIntegrityViolationException

class CarsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [carsInstanceList: Cars.list(params), carsInstanceTotal: Cars.count()]
    }

    def create() {
        [carsInstance: new Cars(params)]
    }

    def save() {
        def carsInstance = new Cars(params)
        if (!carsInstance.save(flush: true)) {
            render(view: "create", model: [carsInstance: carsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cars.label', default: 'Cars'), carsInstance.id])
        redirect(action: "show", id: carsInstance.id)
    }

    def show(Long id) {
        def carsInstance = Cars.get(id)
        if (!carsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cars.label', default: 'Cars'), id])
            redirect(action: "list")
            return
        }

        [carsInstance: carsInstance]
    }

    def edit(Long id) {
        def carsInstance = Cars.get(id)
        if (!carsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cars.label', default: 'Cars'), id])
            redirect(action: "list")
            return
        }

        [carsInstance: carsInstance]
    }
def reserve(Long id, String date){
	def carsInstance = Cars.get(id)
	def s=date
	//def s=date
	//def reservationInstance=new Reservation(date);
	
	//reservationInstance.dateReservation=params.date
	/*reservationInstance.cars_id=carsInstance.id;
	reservationInstance.customer_id=7;
	reservationInstance.save();*/
	[carsInstance:carsInstance, dat:s]
	//return
}
    def update(Long id, Long version) {
        def carsInstance = Cars.get(id)
        if (!carsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cars.label', default: 'Cars'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (carsInstance.version > version) {
                carsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cars.label', default: 'Cars')] as Object[],
                          "Another user has updated this Cars while you were editing")
                render(view: "edit", model: [carsInstance: carsInstance])
                return
            }
        }

        carsInstance.properties = params

        if (!carsInstance.save(flush: true)) {
            render(view: "edit", model: [carsInstance: carsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cars.label', default: 'Cars'), carsInstance.id])
        redirect(action: "show", id: carsInstance.id)
    }

    def delete(Long id) {
        def carsInstance = Cars.get(id)
        if (!carsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cars.label', default: 'Cars'), id])
            redirect(action: "list")
            return
        }

        try {
            carsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cars.label', default: 'Cars'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cars.label', default: 'Cars'), id])
            redirect(action: "show", id: id)
        }
    }
	def search()
	{
		def cars = Cars.executeQuery("SELECT distinct b.marque FROM Cars b")
		
		  [cars : cars]
		
	}
	def result() {
		def param=new Cars(params)
		def result=Cars.findAllByMarque(params.marque)
		//def marque=param.marque.value
		flash.message= "${ result.type_carburant }"
		[carsInstanceList: result, carsInstanceTotal: Cars.count()]
	}
}
