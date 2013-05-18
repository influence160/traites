package com.traites.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(SerieDeTraitesController)
@Mock(SerieDeTraites)
class SerieDeTraitesControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/serieDeTraites/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.serieDeTraitesInstanceList.size() == 0
        assert model.serieDeTraitesInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.serieDeTraitesInstance != null
    }

    void testSave() {
        controller.save()

        assert model.serieDeTraitesInstance != null
        assert view == '/serieDeTraites/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/serieDeTraites/show/1'
        assert controller.flash.message != null
        assert SerieDeTraites.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/serieDeTraites/list'


        populateValidParams(params)
        def serieDeTraites = new SerieDeTraites(params)

        assert serieDeTraites.save() != null

        params.id = serieDeTraites.id

        def model = controller.show()

        assert model.serieDeTraitesInstance == serieDeTraites
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/serieDeTraites/list'


        populateValidParams(params)
        def serieDeTraites = new SerieDeTraites(params)

        assert serieDeTraites.save() != null

        params.id = serieDeTraites.id

        def model = controller.edit()

        assert model.serieDeTraitesInstance == serieDeTraites
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/serieDeTraites/list'

        response.reset()


        populateValidParams(params)
        def serieDeTraites = new SerieDeTraites(params)

        assert serieDeTraites.save() != null

        // test invalid parameters in update
        params.id = serieDeTraites.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/serieDeTraites/edit"
        assert model.serieDeTraitesInstance != null

        serieDeTraites.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/serieDeTraites/show/$serieDeTraites.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        serieDeTraites.clearErrors()

        populateValidParams(params)
        params.id = serieDeTraites.id
        params.version = -1
        controller.update()

        assert view == "/serieDeTraites/edit"
        assert model.serieDeTraitesInstance != null
        assert model.serieDeTraitesInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/serieDeTraites/list'

        response.reset()

        populateValidParams(params)
        def serieDeTraites = new SerieDeTraites(params)

        assert serieDeTraites.save() != null
        assert SerieDeTraites.count() == 1

        params.id = serieDeTraites.id

        controller.delete()

        assert SerieDeTraites.count() == 0
        assert SerieDeTraites.get(serieDeTraites.id) == null
        assert response.redirectedUrl == '/serieDeTraites/list'
    }
}
