//
//  MealsListResponse.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 18.12.24.
//

import Foundation

struct MealsList: Decodable {
    let meals: [MealGeneralResponse]
}

struct MealGeneralResponse: Decodable, Identifiable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    var id: String { idMeal }
}
