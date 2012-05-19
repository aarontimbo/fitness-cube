package com.atimbo.meal

class IngredientController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ingredientInstanceList: Ingredient.list(params), ingredientInstanceTotal: Ingredient.count()]
    }

    def create = {
        def ingredientInstance = new Ingredient()
        ingredientInstance.properties = params
        return [ingredientInstance: ingredientInstance]
    }

    def save = {
        def ingredientInstance = new Ingredient(params)
        if (ingredientInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), ingredientInstance.id])}"
            redirect(action: "show", id: ingredientInstance.id)
        }
        else {
            render(view: "create", model: [ingredientInstance: ingredientInstance])
        }
    }

    def show = {
        def ingredientInstance = Ingredient.get(params.id)
        if (!ingredientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ingredientInstance: ingredientInstance]
        }
    }

    def edit = {
        def ingredientInstance = Ingredient.get(params.id)
        if (!ingredientInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ingredientInstance: ingredientInstance]
        }
    }

    def update = {
        def ingredientInstance = Ingredient.get(params.id)
        if (ingredientInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ingredientInstance.version > version) {
                    
                    ingredientInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ingredient.label', default: 'Ingredient')] as Object[], "Another user has updated this Ingredient while you were editing")
                    render(view: "edit", model: [ingredientInstance: ingredientInstance])
                    return
                }
            }
            ingredientInstance.properties = params
            if (!ingredientInstance.hasErrors() && ingredientInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), ingredientInstance.id])}"
                redirect(action: "show", id: ingredientInstance.id)
            }
            else {
                render(view: "edit", model: [ingredientInstance: ingredientInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ingredientInstance = Ingredient.get(params.id)
        if (ingredientInstance) {
            try {
                ingredientInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ingredient.label', default: 'Ingredient'), params.id])}"
            redirect(action: "list")
        }
    }
}
