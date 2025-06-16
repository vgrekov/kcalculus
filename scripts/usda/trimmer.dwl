/*
USAGE example:
dw \
-i foundationFoods path/to/FoodData_Central_foundation_food.json \
-i surveyFoods path/to/surveyDownload.json \
-i selectNutrients select_nutrients.json \
-f trimmer.dwl \
| gzip > ../../kcalculus/assets/dumps/usda_foods.ndjson.gz
*/

%dw 2.0
output application/x-ndjson
---
(
    foundationFoods.FoundationFoods
    ++ surveyFoods.SurveyFoods
) map ((food) -> {
    fdcId: food.fdcId,
    description: food.description,
    dataType: food.dataType,
    priority: food.dataType match {
        case 'Foundation' -> 0
        case 'Survey (FNDDS)' -> 1
        else -> 2
    },
    portions: food.foodPortions map (portion) -> {
        measureUnitId: portion.measureUnit.id,
        amount: portion.amount,
        gramWeight: portion.gramWeight,
    },
    nutrients: (
        food.foodNutrients
        filter ((nutrient) -> selectNutrients contains nutrient.nutrient.number)
        map (nutrient) -> {
            number: nutrient.nutrient.number,
            amount: nutrient.amount,
            unitName: nutrient.nutrient.unitName,
        }
    )
}) distinctBy lower($.description)
