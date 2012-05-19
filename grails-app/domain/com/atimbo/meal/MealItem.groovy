package com.atimbo.meal

import gov.usda.sr23.*

class MealItem {
	Float servings
	Recipe recipe		// Meal can be a food or recipe, but not both
	Weight foodWeight	// Use multiple meals for multiple recipes eaten

	static belongsTo = [ meal: Meal ]
	
    static constraints = {
		recipe(nullable:true)
		foodWeight(nullable:true)
    }
	
	def Float getValueByNutrient(NutrientDefinition nutrientDefinitionInstance) {
		/**
		* Generic nutrient value calculator for a meal item taking a nutrient definition object
		* (i.e. protein, fat, carb, etc). Returns a float value
		*/
		def val = 0.0
		if (recipe) {
			// Sum nutrient value for all recipe ingredients
			def nutrientDataInstance = null
			recipe.ingredients.each {
				if (it?.foodWeight) {
					nutrientDataInstance = NutrientData.findByFoodAndNutrientDefinition(it?.foodWeight?.food, nutrientDefinitionInstance)				
					val += it.servings * nutrientDataInstance?.nutrientValue * foodWeight?.gramWeight / 100				
				}
			}
		}
		else {
			if (foodWeight) {
				def nutrientDataInstance = NutrientData.findByFoodAndNutrientDefinition(foodWeight?.food, nutrientDefinitionInstance)				
				val = servings * nutrientDataInstance?.nutrientValue * foodWeight?.gramWeight / 100
			}
		}
		return val
		
	}
	
}
