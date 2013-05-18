package com.traites.domain

import org.codehaus.groovy.grails.commons.GrailsApplication;
import org.springframework.dao.DataIntegrityViolationException

class CarnetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
		print(grailsApplication.config.grails.project.groupId);
        redirect(action: "list", params: params)
    }

    def list() {
//		def queries = grailsApplication.mainContext.getBean("namedQueries")
//		print(queries.getProperty("app.grails.version"));
//		def queries2 = grailsApplication.mainContext.getBean("groovyNamedQueries")
//		print(queries2.toString());
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [carnetInstanceList: Carnet.list(params), carnetInstanceTotal: Carnet.count()]
    }

    def create() {
        [carnetInstance: new Carnet(params)]
    }

    def save() {
        def carnetInstance = new Carnet(params)
        if (!carnetInstance.save(flush: true)) {
            render(view: "create", model: [carnetInstance: carnetInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'carnet.label', default: 'Carnet'), carnetInstance.id])
        redirect(action: "show", id: carnetInstance.id)
    }

    def show() {
        def carnetInstance = Carnet.get(params.id)
        if (!carnetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'carnet.label', default: 'Carnet'), params.id])
            redirect(action: "list")
            return
        }

        [carnetInstance: carnetInstance]
    }

    def edit() {
        def carnetInstance = Carnet.get(params.id)
        if (!carnetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carnet.label', default: 'Carnet'), params.id])
            redirect(action: "list")
            return
        }

        [carnetInstance: carnetInstance]
    }

    def update() {
        def carnetInstance = Carnet.get(params.id)
        if (!carnetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carnet.label', default: 'Carnet'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (carnetInstance.version > version) {
                carnetInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'carnet.label', default: 'Carnet')] as Object[],
                          "Another user has updated this Carnet while you were editing")
                render(view: "edit", model: [carnetInstance: carnetInstance])
                return
            }
        }

        carnetInstance.properties = params

        if (!carnetInstance.save(flush: true)) {
            render(view: "edit", model: [carnetInstance: carnetInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'carnet.label', default: 'Carnet'), carnetInstance.id])
        redirect(action: "show", id: carnetInstance.id)
    }

    def delete() {
        def carnetInstance = Carnet.get(params.id)
        if (!carnetInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'carnet.label', default: 'Carnet'), params.id])
            redirect(action: "list")
            return
        }

        try {
            carnetInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'carnet.label', default: 'Carnet'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'carnet.label', default: 'Carnet'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
