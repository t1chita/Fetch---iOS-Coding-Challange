//
//  DetailsView.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 19.12.24.
//

import SwiftUI

struct DetailsView:View {
    @StateObject var detailVM: DetailsViewModel
    @EnvironmentObject var router: NavigationManager
    
    var body: some View {
        ZStack {
            Color
                .black87
                .ignoresSafeArea()

            content()
        }
        .navigationTitle(detailVM.meal.meals[0].strMeal)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func content() -> some View {
        VStack(alignment: .leading, spacing: Constants.mediumSpacing) {
            AsyncImage(url: URL(string:  detailVM.meal.meals[0].strMealThumb)) { image in
                image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFill()
                    .ignoresSafeArea()
                
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                    .scaledToFill()
            }

            ScrollView {
                VStack(alignment: .leading, spacing: Constants.mediumSpacing) {
                    Text(detailVM.meal.meals[0].strMeal)
                        .font(.title)
                        .foregroundStyle(.myWhite)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    categoryAreaAndWebsite()
                        .padding(.horizontal)

                    tags()

                    instructions()
                        .padding(.horizontal)

                    ingredients()
                        .padding(.horizontal)

                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private func categoryAreaAndWebsite() -> some View {
        VStack(alignment: .leading, spacing: Constants.miniSpacing) {
            Text("Category & Area")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.myWhite)
            
            HStack {
                Text(detailVM.meal.meals[0].strCategory)
                    .foregroundStyle(.black60)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 0)
                            .foregroundStyle(.mySecondary)
                            .cornerRadius(20, corners: [.bottomLeft, .topRight])
                    )
                
                Text(detailVM.meal.meals[0].strArea)
                    .foregroundStyle(.black60)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 0)
                            .foregroundStyle(.mySecondary)
                            .cornerRadius(20, corners: [.bottomLeft, .topRight])
                    )
                
                Spacer()
                
                NavigationLink(value: detailVM.meal.meals[0].strSource) {
                    Image(systemName: "globe")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.blue)
                }
                    NavigationLink(value: detailVM.meal.meals[0].strYoutube) {
                        Image(.youtube)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.blue)
                }
            }
        }

    }
    
    private func instructions() -> some View {
        VStack(alignment: .leading, spacing: Constants.miniSpacing) {
            Text("Instructions")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.myWhite)
            
            Text(detailVM.meal.meals[0].strInstructions)
                .font(.body)
                .foregroundStyle(.myWhite)
                .multilineTextAlignment(.leading)
        }
    }
    
    private func tags() -> some View {
        VStack(alignment: .leading, spacing: Constants.miniSpacing) {
            Text("Tags")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.myWhite)
                .padding(.horizontal)

            ScrollView(.horizontal) {
                LazyHStack(alignment: .center) {
                    ForEach(detailVM.meal.meals[0].tags, id: \.self) { tag in
                        Text(tag)
                            .foregroundStyle(.black60)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .foregroundStyle(.myPrimary)
                                    .cornerRadius(20, corners: [.bottomLeft, .topRight])
                            )
                    }
                }
                .padding(.horizontal)

            }
            .scrollIndicators(.hidden)
        }
    }
    
    private func ingredients() -> some View {
        VStack(alignment: .leading, spacing: Constants.miniSpacing) {
            Text("Ingredients & Measurements")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(.myWhite)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(Array(zip(detailVM.meal.meals[0].ingredients, detailVM.meal.meals[0].measures)), id: \.0) { ingredient, measure in
                        HStack {
                            Text(ingredient)
                                .foregroundStyle(.myWhite)
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text(measure)
                                .foregroundStyle(.myWhite)
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
            }
        }
    }
}

extension DetailsView {
    enum Constants {
        static let largeSpacing: CGFloat = 24
        static let mediumSpacing: CGFloat = 12
        static let miniSpacing: CGFloat = 8
    }
}

#Preview {
    DetailsView(detailVM: DetailsViewModel(meal: MealsDetailResponse.MOCK_DETAILS))
        .environmentObject(NavigationManager())
}
