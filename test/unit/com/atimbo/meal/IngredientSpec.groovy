package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*
import gov.usda.sr23.Weight
import gov.usda.sr23.Food
import gov.usda.sr23.FoodGroupDescription

class IngredientSpec extends UnitSpec {
	def debug = true
	
    def "find ingredient by name"() {
		setup:
		mockDomain(Ingredient)
		mockDomain(Weight)
		mockDomain(Food)
		mockDomain(FoodGroupDescription)
		def foodGroup = new FoodGroupDescription(description: group).save()
		def food = new Food(foodGroup: foodGroup, longDescription: description, shortDescription: description).save()
		def foodWeight = new Weight(food: food, sequenceNumber: 1, amount: 1.0, description: unit, gramWeight: 133.0).save()
		
		when:
		new Ingredient(foodWeight: foodWeight).save()
		
		then:
		Ingredient.findByFoodWeight(foodWeight) != null
		if (debug) { println "So glad we made it..." }
		
		where:
		description = "parsnip"
		group = "vegetable"
		unit = "cup"

    }
}
