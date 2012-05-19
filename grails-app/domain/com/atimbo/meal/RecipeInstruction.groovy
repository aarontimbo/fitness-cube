package com.atimbo.meal

class RecipeInstruction {
	Integer step = 1
	String description
	
	static belongsTo = [ recipe: Recipe ]
	
    static constraints = {    
    }

    static mapping = {
        sort "step"
    }
    
}
