package com.atimbo.meal

class Recipe {
	String name
	Integer servingMultiplier
	String description
	
	String toString() { name }
	
	static hasMany = [ ingredients: Ingredient, instructions: RecipeInstruction ]
	
    static constraints = {
    	description(nullable:true,maxSize:2000)
    }
}
