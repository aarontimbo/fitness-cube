package com.atimbo.meal

class MealCategory {
	String name
	String description
	
	String toString() { name }
 
    static constraints = {
    	description(nullable:true)
    }
}
