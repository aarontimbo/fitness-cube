package com.atimbo.meal

import gov.usda.sr23.*
import spock.lang.*
import grails.plugin.spock.*

class RecipeSpec extends UnitSpec {
	def debug = true
	
    def "find recipe by name"() {
		setup:
		mockDomain(Recipe)
		
		when:
		new Recipe(name: name, servingMultiplier: 4).save()
		
		then:
		Recipe.findByName(name) != null
		
		where:
		name = "Parsnip soup"

    }
	
	def "find recipe by ingredient"() {
		setup:
		mockDomain(Recipe)
		mockDomain(Ingredient)
		mockDomain(Weight)
		mockDomain(Food)
		mockDomain(FoodGroupDescription)
		def foodGroup = new FoodGroupDescription(description: group).save()
		def food = new Food(foodGroup: foodGroup, longDescription: description, shortDescription: description).save()
		def foodWeight = new Weight(food: food, sequenceNumber: 1, amount: 1.0, description: unit, gramWeight: 133.0).save()
		def ingredient = new Ingredient(foodWeight: foodWeight, servings: 2.0).save()
		def recipe = new Recipe(name: name, servingMultiplier: 4).save()
		
		when:
		recipe.addToIngredients(ingredient)
		
		then:
		recipe?.ingredients.find{ it == ingredient } != null
		if (debug) { println "Found ingredient ${ingredient} in $name" }
		
		where:
		name = "Parsnip soup"
		description = "parsnip"
		group = "vegetable"
		unit = "cup"

	}
}
