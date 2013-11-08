package domain



import org.junit.*
import grails.test.mixin.*

@TestFor(CarsController)
@Mock(Cars)
class CarsControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cars/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.carsInstanceList.size() == 0
        assert model.carsInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.carsInstance != null
    }

    void testSave() {
        controller.save()

        assert model.carsInstance != null
        assert view == '/cars/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cars/show/1'
        assert controller.flash.message != null
        assert Cars.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cars/list'

        populateValidParams(params)
        def cars = new Cars(params)

        assert cars.save() != null

        params.id = cars.id

        def model = controller.show()

        assert model.carsInstance == cars
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cars/list'

        populateValidParams(params)
        def cars = new Cars(params)

        assert cars.save() != null

        params.id = cars.id

        def model = controller.edit()

        assert model.carsInstance == cars
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cars/list'

        response.reset()

        populateValidParams(params)
        def cars = new Cars(params)

        assert cars.save() != null

        // test invalid parameters in update
        params.id = cars.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cars/edit"
        assert model.carsInstance != null

        cars.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cars/show/$cars.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cars.clearErrors()

        populateValidParams(params)
        params.id = cars.id
        params.version = -1
        controller.update()

        assert view == "/cars/edit"
        assert model.carsInstance != null
        assert model.carsInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cars/list'

        response.reset()

        populateValidParams(params)
        def cars = new Cars(params)

        assert cars.save() != null
        assert Cars.count() == 1

        params.id = cars.id

        controller.delete()

        assert Cars.count() == 0
        assert Cars.get(cars.id) == null
        assert response.redirectedUrl == '/cars/list'
    }
}
