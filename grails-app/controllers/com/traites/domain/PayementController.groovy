package com.traites.domain

import org.springframework.dao.DataIntegrityViolationException

class PayementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [payementInstanceList: Payement.list(params), payementInstanceTotal: Payement.count()]
    }

    def create() {
        [payementInstance: new Payement(params)]
    }

    def save() {
        def payementInstance = new Payement(params)
        if (!payementInstance.save(flush: true)) {
            render(view: "create", model: [payementInstance: payementInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'payement.label', default: 'Payement'), payementInstance.id])
        redirect(action: "show", id: payementInstance.id)
    }

    def show() {
        def payementInstance = Payement.get(params.id)
        if (!payementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'payement.label', default: 'Payement'), params.id])
            redirect(action: "list")
            return
        }

        [payementInstance: payementInstance]
    }

    def edit() {
        def payementInstance = Payement.get(params.id)
        if (!payementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payement.label', default: 'Payement'), params.id])
            redirect(action: "list")
            return
        }

        [payementInstance: payementInstance]
    }

    def update() {
        def payementInstance = Payement.get(params.id)
        if (!payementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payement.label', default: 'Payement'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (payementInstance.version > version) {
                payementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'payement.label', default: 'Payement')] as Object[],
                          "Another user has updated this Payement while you were editing")
                render(view: "edit", model: [payementInstance: payementInstance])
                return
            }
        }

        payementInstance.properties = params

        if (!payementInstance.save(flush: true)) {
            render(view: "edit", model: [payementInstance: payementInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'payement.label', default: 'Payement'), payementInstance.id])
        redirect(action: "show", id: payementInstance.id)
    }

    def delete() {
        def payementInstance = Payement.get(params.id)
        if (!payementInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'payement.label', default: 'Payement'), params.id])
            redirect(action: "list")
            return
        }

        try {
            payementInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'payement.label', default: 'Payement'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'payement.label', default: 'Payement'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
