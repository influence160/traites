package com.traites.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(TraiteController)
@Mock(Traite)
class TraiteControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/traite/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.traiteInstanceList.size() == 0
        assert model.traiteInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.traiteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.traiteInstance != null
        assert view == '/traite/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/traite/show/1'
        assert controller.flash.message != null
        assert Traite.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/traite/list'


        populateValidParams(params)
        def traite = new Traite(params)

        assert traite.save() != null

        params.id = traite.id

        def model = controller.show()

        assert model.traiteInstance == traite
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/traite/list'


        populateValidParams(params)
        def traite = new Traite(params)

        assert traite.save() != null

        params.id = traite.id

        def model = controller.edit()

        assert model.traiteInstance == traite
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/traite/list'

        response.reset()


        populateValidParams(params)
        def traite = new Traite(params)

        assert traite.save() != null

        // test invalid parameters in update
        params.id = traite.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/traite/edit"
        assert model.traiteInstance != null

        traite.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/traite/show/$traite.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        traite.clearErrors()

        populateValidParams(params)
        params.id = traite.id
        params.version = -1
        controller.update()

        assert view == "/traite/edit"
        assert model.traiteInstance != null
        assert model.traiteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/traite/list'

        response.reset()

        populateValidParams(params)
        def traite = new Traite(params)

        assert traite.save() != null
        assert Traite.count() == 1

        params.id = traite.id

        controller.delete()

        assert Traite.count() == 0
        assert Traite.get(traite.id) == null
        assert response.redirectedUrl == '/traite/list'
    }
}
