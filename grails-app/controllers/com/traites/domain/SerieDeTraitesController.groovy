package com.traites.domain

import org.springframework.dao.DataIntegrityViolationException

class SerieDeTraitesController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [serieDeTraitesInstanceList: SerieDeTraites.list(params), serieDeTraitesInstanceTotal: SerieDeTraites.count()]
    }

    def create() {
        [serieDeTraitesInstance: new SerieDeTraites(params)]
    }

    def save() {
        def serieDeTraitesInstance = new SerieDeTraites(params)
        if (!serieDeTraitesInstance.save(flush: true)) {
            render(view: "create", model: [serieDeTraitesInstance: serieDeTraitesInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites'), serieDeTraitesInstance.id])
        redirect(action: "show", id: serieDeTraitesInstance.id)
    }

    def show() {
        def serieDeTraitesInstance = SerieDeTraites.get(params.id)
        if (!serieDeTraitesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites'), params.id])
            redirect(action: "list")
            return
        }

        [serieDeTraitesInstance: serieDeTraitesInstance]
    }

    def edit() {
        def serieDeTraitesInstance = SerieDeTraites.get(params.id)
        if (!serieDeTraitesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites'), params.id])
            redirect(action: "list")
            return
        }

        [serieDeTraitesInstance: serieDeTraitesInstance]
    }

    def update() {
        def serieDeTraitesInstance = SerieDeTraites.get(params.id)
        if (!serieDeTraitesInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (serieDeTraitesInstance.version > version) {
                serieDeTraitesInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'serieDeTraites.label', default: 'SerieDeTraites')] as Object[],
                          "Another user has updated this SerieDeTraites while you were editing")
                render(view: "edit", model: [serieDeTraitesInstance: serieDeTraitesInstance])
                return
            }
        }

        serieDeTraitesInstance.properties = params

        if (!serieDeTraitesInstance.save(flush: true)) {
            render(view: "edit", model: [serieDeTraitesInstance: serieDeTraitesInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites'), serieDeTraitesInstance.id])
        redirect(action: "show", id: serieDeTraitesInstance.id)
    }

    def delete() {
        def serieDeTraitesInstance = SerieDeTraites.get(params.id)
        if (!serieDeTraitesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites'), params.id])
            redirect(action: "list")
            return
        }

        try {
            serieDeTraitesInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	def traitesTemplate(){
		def serieDeTraitesInstance = SerieDeTraites.get(params.id)
		if (!serieDeTraitesInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'serieDeTraites.label', default: 'SerieDeTraites'), params.id])
			redirect(action: "list")
			return
		}
		[serieDeTraitesInstance: serieDeTraitesInstance]
	}
}
