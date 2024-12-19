//
//  DetailsViewModel.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 19.12.24.
//


import Foundation

@MainActor
final class DetailsViewModel: ObservableObject {
    @Published var meal: MealsDetailResponse?

    init(mealId: String) {
        Task {
            await fetchMealDetail(mealID: mealId)
        }
    }

    private func fetchMealDetail(mealID: String) async {
        do {
            let fetchedMeal = try await getMealDetail(mealID: mealID)
            DispatchQueue.main.async {
                self.meal = fetchedMeal
            }
        } catch {
            print("Error fetching meal details: \(error)")
        }
    }

    private func getMealDetail(mealID: String) async throws -> MealsDetailResponse {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(MealsDetailResponse.self, from: data)
    }
}

