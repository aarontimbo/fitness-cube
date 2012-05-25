package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*

class MealSpec extends UnitSpec {

    def "find a meal by category"() {
		setup:
		mockDomain(Meal)
		mockDomain(MealCategory)
		def mealCategory = new MealCategory(name: name).save()
		
		when:
		new Meal(category: mealCategory, mealTime: new Date()).save()

		then:
		Meal.findByCategory(mealCategory) != null
		
		where:
		name = "dinner"

    }
	
	
}
