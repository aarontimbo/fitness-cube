package com.atimbo.secure

import com.atimbo.meal.Meal

class Profile {
	String name
	Date birthdate
	byte[] avatar
	String avatarType
	Float heightInches
	Float weightLbs
	Float bmi
	
	static belongsTo = [ user: SecUser ]
	
	static hasMany = [ meals: Meal ]
	
    static constraints = {
    	name(maxSize:50)	
	    avatar(nullable:true, maxSize: 16384 /* 16K */)
    	avatarType(nullable:true)
    	heightInches(nullable:true)	
    	weightLbs(nullable:true)	
    	bmi(nullable:true)	
    }
}
