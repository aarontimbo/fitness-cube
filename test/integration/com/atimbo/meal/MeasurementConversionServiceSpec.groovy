package com.atimbo.meal

import gov.usda.sr23.*
import spock.lang.*
import grails.plugin.spock.*

class MeasurementConversionServiceSpec extends IntegrationSpec {
	def measurementConversionService
	
	def debug = true
	
    def "Calculate food weight in grams"() {
		/**
		 * NOTE: Cannot use build-data plugin here or
		 * create new objects because the nutrient data
		 * domain classes are all read-only.
		 */
		setup:
		def food = Food.read('11298')
		assert food
		def weight = Weight.findByFoodAndSequenceNumber(food, '1')
		assert weight
		
		when:
		def grams = measurementConversionService.convertToGram(weight,amount)
		
		then:
		assert grams
		if (debug) {
			println "If $weight, then the calculated amount of $amount servings of $food is $grams grams"
		}
		
		where:
		description = "parsnip"
		group = "vegetable"
		amount = 4.0		// cups of food
		
    }
}
