package com.atimbo.meal

import gov.usda.sr23.*

class FoodService {

    static transactional = false

    def serviceMethod() {

    }

    def getFood(params) {
        def c = Food.createCriteria()

        def food = c.list {
            like('longDescription', '%' + params.name_contains + '%')
        }
        return food
    }    
}
