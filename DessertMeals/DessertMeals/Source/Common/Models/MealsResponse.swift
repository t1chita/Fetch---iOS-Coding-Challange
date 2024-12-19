//
//  MealsResponse.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 18.12.24.
//


import Foundation

// MARK: - MealsResponse
struct MealsDetailResponse: Codable {
    let meals: [MealDetails]
}

// MARK: - Meal
struct MealDetails: Codable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
}

extension MealsDetailResponse {
    static var MOCK_DETAILS = MealsDetailResponse(
        meals: [
            MealDetails(
                idMeal: "52769",
                strMeal: "Kapsalon",
                strDrinkAlternate: nil,
                strCategory: "Lamb",
                strArea: "Dutch",
                strInstructions: """
                Cut the meat into strips. Heat oil in a pan and fry the strips for 6 minutes until it's ready. Bake the fries until golden brown in a deep fryer. When ready transfer to a backing dish. Make sure the fries are spread over the whole dish. Cover the fries with a new layer of meat and spread evenly. Add a layer of cheese over the meat. You can also use grated cheese. When done put in the oven for a few minutes until the cheese is melted. Chop the lettuce, tomato and cucumber in small pieces and mix together for a basic salad. As extra you can add olives, jalapenos, and a red onion. Divide the salad over the dish and serve with garlic sauce and hot sauce.
                """,
                strMealThumb: "https://www.themealdb.com/images/media/meals/sxysrt1468240488.jpg",
                strTags: "Snack",
                strYoutube: "https://www.youtube.com/watch?v=UIcuiU1kV8I",
                strIngredient1: "Fries",
                strIngredient2: "Doner Meat",
                strIngredient3: "Garlic sauce",
                strIngredient4: "Hotsauce",
                strIngredient5: "Lettuce",
                strIngredient6: "Tomato",
                strIngredient7: "Cucumber",
                strIngredient8: "Gouda cheese",
                strIngredient9: "",
                strIngredient10: "",
                strIngredient11: "",
                strIngredient12: "",
                strIngredient13: "",
                strIngredient14: "",
                strIngredient15: "",
                strIngredient16: nil,
                strIngredient17: nil,
                strIngredient18: nil,
                strIngredient19: nil,
                strIngredient20: nil,
                strMeasure1: "250 Grams",
                strMeasure2: "500 Grams",
                strMeasure3: "Topping",
                strMeasure4: "Topping",
                strMeasure5: "1 Bulb",
                strMeasure6: "1",
                strMeasure7: "3rd",
                strMeasure8: "100 Grams",
                strMeasure9: "",
                strMeasure10: "",
                strMeasure11: "",
                strMeasure12: "",
                strMeasure13: "",
                strMeasure14: "",
                strMeasure15: "",
                strMeasure16: nil,
                strMeasure17: nil,
                strMeasure18: nil,
                strMeasure19: nil,
                strMeasure20: nil,
                strSource: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
                strImageSource: nil,
                strCreativeCommonsConfirmed: nil,
                dateModified: nil
            )
        ]
    )

}
