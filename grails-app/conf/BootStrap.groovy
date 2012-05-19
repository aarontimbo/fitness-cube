import com.atimbo.meal.*
import com.atimbo.secure.*

class BootStrap {

    def init = { servletContext ->
    
		// Create measurement units
		def	measurementUnitList = [
			[ name:"g" ],
			[ name:"bunch" ],
			[ name:"can" ],
			[ name:"cup" ],
			[ name:"lb" ],
			[ name:"mg" ],
			[ name:"oz" ],
			[ name:"tbsp" ],
			[ name:"tsp" ],
			[ name:"small" ],
			[ name:"medium" ],
			[ name:"large" ]			
		]   
		
		measurementUnitList.each{ obj ->
			def measurementUnitInstance = MeasurementUnit.findByName(obj.name)
			if (! measurementUnitInstance ) {
				measurementUnitInstance = new MeasurementUnit(name:obj.name).save(flush:true)
			}
		}
		 
		// Create meal categories
		def	mealCategoryList = [
			[ name:"Breakfast" ],
			[ name:"Lunch" ],
			[ name:"Dinner" ],
			[ name:"AM Snack" ],
			[ name:"PM Snack" ],
			[ name:"Evening Snack" ]
		]   
		
		mealCategoryList.each{ obj ->
			def mealCategoryInstance = MealCategory.findByName(obj.name)
			if (! mealCategoryInstance ) {
				mealCategoryInstance = new MealCategory(name:obj.name).save(flush:true)
			}
		}
		 
    	environments {
			development {
				// Create a default user
				def user = new SecUser(username:'ast',password:'juve10').save(flush:true)
				
				// Create a default profile
				def profile = new Profile(user:user,name:'Paleo Dude',birthdate:new Date('02/22/1975')).save(flush:true)
				
				user.addToProfiles(profile).save()
			}
    	}    
    }
    def destroy = {
    }
}
