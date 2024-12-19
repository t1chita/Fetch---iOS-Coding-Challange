//
//  DessertMealsApp.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 18.12.24.
//

import SwiftUI

@main
struct DessertMealsApp: App {
    @StateObject var router: NavigationManager = NavigationManager()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeView(homeVM: HomeViewModel())
                .navigationDestination(for: NavigationManager.Destination.self) { destination in
                    switch destination {
                    case .details(let id):
                        Text("ID")
                    }
                }
            }
            .environmentObject(router)
        }
    }
}
