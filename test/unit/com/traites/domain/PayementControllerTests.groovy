package com.traites.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(PayementController)
@Mock(Payement)
class PayementControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/payement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.payementInstanceList.size() == 0
        assert model.payementInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.payementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.payementInstance != null
        assert view == '/payement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/payement/show/1'
        assert controller.flash.message != null
        assert Payement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/payement/list'


        populateValidParams(params)
        def payement = new Payement(params)

        assert payement.save() != null

        params.id = payement.id

        def model = controller.show()

        assert model.payementInstance == payement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/payement/list'


        populateValidParams(params)
        def payement = new Payement(params)

        assert payement.save() != null

        params.id = payement.id

        def model = controller.edit()

        assert model.payementInstance == payement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/payement/list'

        response.reset()


        populateValidParams(params)
        def payement = new Payement(params)

        assert payement.save() != null

        // test invalid parameters in update
        params.id = payement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/payement/edit"
        assert model.payementInstance != null

        payement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/payement/show/$payement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        payement.clearErrors()

        populateValidParams(params)
        params.id = payement.id
        params.version = -1
        controller.update()

        assert view == "/payement/edit"
        assert model.payementInstance != null
        assert model.payementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/payement/list'

        response.reset()

        populateValidParams(params)
        def payement = new Payement(params)

        assert payement.save() != null
        assert Payement.count() == 1

        params.id = payement.id

        controller.delete()

        assert Payement.count() == 0
        assert Payement.get(payement.id) == null
        assert response.redirectedUrl == '/payement/list'
    }
}
