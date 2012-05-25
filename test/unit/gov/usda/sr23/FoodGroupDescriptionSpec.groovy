package gov.usda.sr23

import spock.lang.*
import grails.plugin.spock.*

class FoodGroupDescriptionSpec extends UnitSpec {

    def "find food group by name"() {
		setup:
		mockDomain(FoodGroupDescription)
		
		when:
		new FoodGroupDescription(description: description).save()

		then:
		FoodGroupDescription.findByDescription(description) != null
		
		where:
		description = "vegetable"
    }
}
