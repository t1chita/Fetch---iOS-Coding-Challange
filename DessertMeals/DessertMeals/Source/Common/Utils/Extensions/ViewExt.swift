//
//  ViewExt.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 19.12.24.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
