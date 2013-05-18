package com.traites.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(CarnetController)
@Mock(Carnet)
class CarnetControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/carnet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.carnetInstanceList.size() == 0
        assert model.carnetInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.carnetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.carnetInstance != null
        assert view == '/carnet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/carnet/show/1'
        assert controller.flash.message != null
        assert Carnet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/carnet/list'


        populateValidParams(params)
        def carnet = new Carnet(params)

        assert carnet.save() != null

        params.id = carnet.id

        def model = controller.show()

        assert model.carnetInstance == carnet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/carnet/list'


        populateValidParams(params)
        def carnet = new Carnet(params)

        assert carnet.save() != null

        params.id = carnet.id

        def model = controller.edit()

        assert model.carnetInstance == carnet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/carnet/list'

        response.reset()


        populateValidParams(params)
        def carnet = new Carnet(params)

        assert carnet.save() != null

        // test invalid parameters in update
        params.id = carnet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/carnet/edit"
        assert model.carnetInstance != null

        carnet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/carnet/show/$carnet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        carnet.clearErrors()

        populateValidParams(params)
        params.id = carnet.id
        params.version = -1
        controller.update()

        assert view == "/carnet/edit"
        assert model.carnetInstance != null
        assert model.carnetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/carnet/list'

        response.reset()

        populateValidParams(params)
        def carnet = new Carnet(params)

        assert carnet.save() != null
        assert Carnet.count() == 1

        params.id = carnet.id

        controller.delete()

        assert Carnet.count() == 0
        assert Carnet.get(carnet.id) == null
        assert response.redirectedUrl == '/carnet/list'
    }
}
