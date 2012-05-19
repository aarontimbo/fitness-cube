package com.atimbo.meal

import com.atimbo.secure.Profile
import gov.usda.sr23.*


class Meal {
	MealCategory category
	Date mealTime
	String note
	
	Date dateCreated
	Date lastUpdated
	
	static belongsTo = [ profile: Profile ]
	
	static hasMany = [ mealItems: MealItem ]
		
    static constraints = {
        dateCreated(display:false)
        lastUpdated(display:false) 
        note(nullable:true,maxSize:4000)       
    }
	
	def Float getValueByNutrient(NutrientDefinition nutrientDefinitionInstance) {
		/**
		* Generic nutrient value calculator for a meal taking a nutrient definition object
		* (i.e. protein, fat, carb, etc). Returns a float value.
		*/
		def val = 0.0
		if (mealItems) {
			// Sum nutrient value for all meal items
			mealItems.each {
				if (it?.foodWeight) {
					val += it.getValueByNutrient(nutrientDefinitionInstance)			
				}
			}
		}
		return val
		
	}

	// Calculate percentage of total calories by nutrient
    def Float getPctOfCaloriesByNutrient(NutrientDefinition nutrientDefinitionInstance) {
 		def val = 0
    	if (mealItems) {
    		def calSum = 0
    		def calorieInstance = NutrientDefinition.read('208')		// Energy (kcal)
    		// Sum calories for all meal items
			mealItems.each {
				if (it?.foodWeight) {
					calSum += it.getValueByNutrient(calorieInstance)			
				}
			}
    		
			// Sum nutrient value for all meal items
    		def valSum = 0
			mealItems.each {
				valSum += it.getValueByNutrient(nutrientDefinitionInstance)			
			}
			val = (valSum / calSum) * 100.0
    	}
		return val    		
    }

}
