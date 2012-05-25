package gov.usda.sr23

import spock.lang.*
import grails.plugin.spock.*

class WeightSpec extends UnitSpec {

    def "find weight by name"() {
		setup:
		mockDomain(Weight)
		mockDomain(Food)
		mockDomain(FoodGroupDescription)
		def foodGroup = new FoodGroupDescription(description: group).save()
		def food = new Food(foodGroup: foodGroup, longDescription: description, shortDescription: description).save()
		
		when:
		new Weight(food: food, sequenceNumber: 1, amount: 1.0, description: "cup", gramWeight: 133.0).save()

		then:
		Weight.findByFood(food) != null
		
		where:
		description = "parsnip"
		group = "vegetable"

    }
}
