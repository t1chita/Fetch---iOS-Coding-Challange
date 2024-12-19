//
//  HomeViewModel.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 18.12.24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var meals: [MealGeneralResponse] = []
    @Published var isLoading: Bool = false
    @Published var searchQuery: String = ""
    
    private var sortedAlphabetically: [MealGeneralResponse] {
        meals.sorted { $0.strMeal < $1.strMeal }
    }
    
    var filteredMeals: [MealGeneralResponse] {
        if searchQuery.isEmpty {
            return sortedAlphabetically
        } else {
            return sortedAlphabetically.filter { $0.strMeal.lowercased().contains(searchQuery.lowercased()) }
        }
    }
    
    init() {
        Task {
            do {
                try await getMealList()
            } catch let networkError as NetworkError {
                print(networkError.errorDescription ?? "An unknown error occurred")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func getMealList() async throws {
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(MealsList.self, from: data)
            meals = decodedResponse.meals
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}

// MARK: - Network Error Enum
enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .invalidResponse:
            return "The server responded with an error."
        case .decodingFailed:
            return "Failed to decode the data from the server."
        }
    }
}
