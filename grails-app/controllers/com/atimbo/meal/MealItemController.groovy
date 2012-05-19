package com.atimbo.meal

import grails.converters.JSON

class MealItemController {
	def debug = true
	//def debug = false
	def foodService
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [mealItemInstanceList: MealItem.list(params), mealItemInstanceTotal: MealItem.count()]
    }

    def create = {
        def mealItemInstance = new MealItem()
        mealItemInstance.properties = params
        return [mealItemInstance: mealItemInstance]
    }

    def save = {
        def mealItemInstance = new MealItem(params)
        if (mealItemInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'mealItem.label', default: 'MealItem'), mealItemInstance.id])}"
            redirect(action: "show", id: mealItemInstance.id)
        }
        else {
            render(view: "create", model: [mealItemInstance: mealItemInstance])
        }
    }

    def show = {
        def mealItemInstance = MealItem.get(params.id)
        if (!mealItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mealItem.label', default: 'MealItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            [mealItemInstance: mealItemInstance]
        }
    }

    def edit = {
        def mealItemInstance = MealItem.get(params.id)
        if (!mealItemInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mealItem.label', default: 'MealItem'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [mealItemInstance: mealItemInstance]
        }
    }

    def update = {
        def mealItemInstance = MealItem.get(params.id)
        if (mealItemInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (mealItemInstance.version > version) {
                    
                    mealItemInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'mealItem.label', default: 'MealItem')] as Object[], "Another user has updated this MealItem while you were editing")
                    render(view: "edit", model: [mealItemInstance: mealItemInstance])
                    return
                }
            }
            mealItemInstance.properties = params
            if (!mealItemInstance.hasErrors() && mealItemInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'mealItem.label', default: 'MealItem'), mealItemInstance.id])}"
                redirect(action: "show", id: mealItemInstance.id)
            }
            else {
                render(view: "edit", model: [mealItemInstance: mealItemInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mealItem.label', default: 'MealItem'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def mealItemInstance = MealItem.get(params.id)
        if (mealItemInstance) {
            try {
                mealItemInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'mealItem.label', default: 'MealItem'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'mealItem.label', default: 'MealItem'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'mealItem.label', default: 'MealItem'), params.id])}"
            redirect(action: "list")
        }
    }
    
	def ajaxGetFood = {
        if( params.name_contains ) {
            def food = foodService.getFood(params)

			if (debug) {
				println "food::${food}"
			}
			
            render food as JSON
        }
    }    
}
