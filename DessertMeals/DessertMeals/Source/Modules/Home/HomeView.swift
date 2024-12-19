//
//  HomeView.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 18.12.24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM: HomeViewModel
    @EnvironmentObject var router: NavigationManager
    var body: some View {
        ZStack {
            Color.black87
                .ignoresSafeArea()
            Group {
                if !homeVM.isLoading {
                    content()
                } else {
                    ProgressView {
                        Text("Meals Are Loading")
                            .font(.headline)
                            .foregroundStyle(.myWhite)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.myGray.opacity(0.2))
                    )
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Meals List")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.mySecondary)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func content() -> some View  {
        //TODO: - Add Async Images Struct
        List(homeVM.filteredMeals) { meal in
            HStack(alignment: .top, spacing: Constants.mediumSpacing) {
                // Meal Image
                AsyncImage(url: URL(string: meal.strMealThumb)!) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: ImageSize.height)
                        .cornerRadius(20, corners: [.topRight, .bottomRight])
                    
                } placeholder: {
                    ProgressView()
                        .frame(height: ImageSize.height)
                        .frame(width: ImageSize.height)
                }
                VStackLayout(alignment: .leading) {
                    Text(meal.strMeal)
                        .font(.headline)
                        .foregroundStyle(.myWhite)
                    
                    Spacer()
                    
                    DMButton(
                        buttonText: "Let's Cook",
                        buttonStyle: .primary) {
                            print(meal.idMeal)
                        }
                }
                
                Spacer()
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        .padding(.horizontal, -16)
        .background(Color.clear)
        .scrollContentBackground(.hidden)
        .listStyle(PlainListStyle())
        .searchable(text: $homeVM.searchQuery, placement: .automatic, prompt: "Search Meal")
    }
}

extension HomeView {
    enum Constants {
        static let mediumSpacing: CGFloat = 12
    }
    
    enum ImageSize {
        static let width: CFloat = 200
        static let height: CGFloat? = 150
    }
}

#Preview {
    HomeView(homeVM: HomeViewModel())
        .environmentObject(NavigationManager())
}
