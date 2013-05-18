package com.traites.domain

import org.springframework.dao.DataIntegrityViolationException

class TraiteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [traiteInstanceList: Traite.list(params), traiteInstanceTotal: Traite.count()]
    }

    def create() {
        [traiteInstance: new Traite(params)]
    }

    def save() {
        def traiteInstance = new Traite(params)
        if (!traiteInstance.save(flush: true)) {
            render(view: "create", model: [traiteInstance: traiteInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'traite.label', default: 'Traite'), traiteInstance.id])
        redirect(action: "show", id: traiteInstance.id)
    }

    def show() {
        def traiteInstance = Traite.get(params.id)
        if (!traiteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'traite.label', default: 'Traite'), params.id])
            redirect(action: "list")
            return
        }

        [traiteInstance: traiteInstance]
    }

    def edit() {
        def traiteInstance = Traite.get(params.id)
        if (!traiteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'traite.label', default: 'Traite'), params.id])
            redirect(action: "list")
            return
        }

        [traiteInstance: traiteInstance]
    }

    def update() {
        def traiteInstance = Traite.get(params.id)
        if (!traiteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'traite.label', default: 'Traite'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (traiteInstance.version > version) {
                traiteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'traite.label', default: 'Traite')] as Object[],
                          "Another user has updated this Traite while you were editing")
                render(view: "edit", model: [traiteInstance: traiteInstance])
                return
            }
        }

        traiteInstance.properties = params

        if (!traiteInstance.save(flush: true)) {
            render(view: "edit", model: [traiteInstance: traiteInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'traite.label', default: 'Traite'), traiteInstance.id])
        redirect(action: "show", id: traiteInstance.id)
    }

    def delete() {
        def traiteInstance = Traite.get(params.id)
        if (!traiteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'traite.label', default: 'Traite'), params.id])
            redirect(action: "list")
            return
        }

        try {
            traiteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'traite.label', default: 'Traite'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'traite.label', default: 'Traite'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
