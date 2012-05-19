/**
* NOTE: nutrient value is calculated as per 100 grams of edible portion
**/


//package gov.usda.sr23

def food = gov.usda.sr23.Food.read('01001')

println "food::${food}"

def weight = gov.usda.sr23.Weight.findByFoodAndSequenceNumber(food,1)

println "weight.sequenceNumber::${weight.sequenceNumber}::weight::${weight}"

//def nutrientDefinition = gov.usda.sr23.NutrientDefinition.read('203')        // protein
//def nutrientDefinition = gov.usda.sr23.NutrientDefinition.read('204')        // fat
//def nutrientDefinition = gov.usda.sr23.NutrientDefinition.read('205')        // carb
def nutrientDefinition = gov.usda.sr23.NutrientDefinition.read('208')        // calories KCAL

println "nutrientDefinition::${nutrientDefinition}"

def nutrientData = gov.usda.sr23.NutrientData.findByFoodAndNutrientDefinition(food,nutrientDefinition)

println "nutrientData.nutrientDefinition.units::${nutrientData.nutrientDefinition.units}::nutrientData.nutrientValue::${nutrientData.nutrientValue}"

def nutVal = nutrientData.nutrientValue * weight.gramWeight / 100

def nutValStr = String.format('%,6.0f', nutVal)

//println "\n\n${nutrientData.nutrientDefinition.description}(${nutrientData.nutrientDefinition.units}) in a cup of butter = ${nutValOfCupButter}"
println "\n\n${nutrientData.nutrientDefinition.description} in a cup of butter = ${nutValStr}${nutrientData.nutrientDefinition.units}"

//def caloriesFromNutrient = nutValOfCupButter * food.fatFactor

//println "\n${nutrientData.nutrientDefinition.description} in a cup of butter = ${caloriesFromNutrient}"
