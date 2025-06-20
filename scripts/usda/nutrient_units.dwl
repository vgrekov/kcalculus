/*
USAGE example:
dw \
-i foundationFoods path/to/FoodData_Central_foundation_food.json \
-i surveyFoods path/to/surveyDownload.json \
-i selectNutrients select_nutrients.json \
-f nutrient_units.dwl \
-o ./nutrient_units.json
*/

%dw 2.0
output application/json
---
flatten(
    (
        foundationFoods.FoundationFoods
        ++ surveyFoods.SurveyFoods
    ) map (food) -> (
        food.foodNutrients
        filter ((nutrient) -> selectNutrients contains nutrient.nutrient.number)
        map (nutrient) -> nutrient.nutrient.unitName
    )
)
distinctBy $
orderBy $