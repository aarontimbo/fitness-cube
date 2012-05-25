package gov.usda.sr23

import spock.lang.*
import grails.plugin.spock.*

class FoodSpec extends UnitSpec {

    def "find food by name"() {
		setup:
		mockDomain(Food)
		mockDomain(FoodGroupDescription)
		def foodGroup = new FoodGroupDescription(description: group).save()
		
		when:
		new Food(foodGroup: foodGroup, longDescription: description, shortDescription: description).save()

		then:
		Food.findByLongDescription(description) != null
		
		where:
		description = "parsnip"
		group = "vegetable"

    }
}
