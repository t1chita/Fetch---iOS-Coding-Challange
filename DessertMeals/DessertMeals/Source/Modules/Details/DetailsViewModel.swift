//
//  DetailsViewModel.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 19.12.24.
//

import Foundation

final class DetailsViewModel: ObservableObject {
    let meal: MealsDetailResponse
    
    
    init(meal: MealsDetailResponse) {
        self.meal = meal
    }
}
