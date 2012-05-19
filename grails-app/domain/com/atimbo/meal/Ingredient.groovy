package com.atimbo.meal

import gov.usda.sr23.Weight

class Ingredient {
	String name 
	Weight foodWeight
	Float servings
	Integer sortOrder = 1
	
	String toString() {
		if (amount) {
			servings + ' x ' + foodWeight + ' ' + foodWeight.food
		}
		else { food }
	}
	
    static constraints = {
    	foodWeight(nullable:true)   	
    }
    
    static mapping = {
        sort "sortOrder"
    }
}
