//
//  MealThumbnailImage.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 19.12.24.
//

import SwiftUI

struct MealThumbnailImage: View {
    @StateObject var imageLoader: ImageLoader
    
    init(url: URL) {
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                    .frame(height: ImageSize.height)
                    .cornerRadius(20, corners: [.topRight, .bottomRight])
            } else {
                ProgressView()
                    .frame(height: ImageSize.height)
                    .frame(width: ImageSize.height)
            }
        }
        .onAppear {
            Task {
                await imageLoader.fetchImage()
            }
        }
    }
}

extension MealThumbnailImage {
    enum ImageSize {
        static let height: CGFloat? = 150
    }
}
