package com.atimbo.meal

import gov.usda.sr23.*
import spock.lang.*
import grails.plugin.spock.*

class MealItemSpec extends UnitSpec {
	def debug = true
	
    def "find meal item by meal"() {
		setup:
		mockDomain(MealItem)
		mockDomain(Meal)
		mockDomain(MealCategory)
		def mealCategory = new MealCategory(name: name).save()
		assert mealCategory
		def meal = new Meal(category: mealCategory, mealTime: new Date()).save()
		
		when:
		new MealItem(meal: meal, servings: 1).save()
		
		then:
		MealItem.findByMeal(meal) != null
		
		where:
		name = "dinner"

    }
	
	def "find meal item by food weight"() {
		setup:
		mockDomain(MealItem)
		mockDomain(Meal)
		mockDomain(MealCategory)
		mockDomain(Weight)
		mockDomain(Food)
		mockDomain(FoodGroupDescription)
		def foodGroup = new FoodGroupDescription(description: group).save()
		def food = new Food(foodGroup: foodGroup, longDescription: description, shortDescription: description).save()
		def foodWeight = new Weight(food: food, sequenceNumber: servings, amount: 1.0, description: unit, gramWeight: 133.0).save()
		def mealCategory = new MealCategory(name: name).save()
		def meal = new Meal(category: mealCategory, mealTime: new Date()).save()
		
		when:
		new MealItem(meal: meal, servings: 1, foodWeight: foodWeight).save()
		
		then:
		MealItem.findByFoodWeight(foodWeight) != null
		// TODO:
		if (debug) { println "Display nutrient value for meal item here" }
		
		where:
		name = "dinner"
		description = "parsnip"
		group = "vegetable"
		unit = "cup"
		servings = 1
	}
}
