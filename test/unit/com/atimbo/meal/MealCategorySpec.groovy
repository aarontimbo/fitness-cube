package com.atimbo.meal

import spock.lang.*
import grails.plugin.spock.*

class MealCategorySpec extends UnitSpec {

    def "find meal category by name"() {
		setup:
		mockDomain(MealCategory)
		
		when:
		new MealCategory(name: name).save()

		then:
		MealCategory.findByName(name) != null
		
		where:
		name = "dinner"
    }
}
