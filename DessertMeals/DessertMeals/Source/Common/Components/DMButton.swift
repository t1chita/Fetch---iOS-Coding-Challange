//
//  DMButton.swift
//  DessertMeals
//
//  Created by Temur Chitashvili on 19.12.24.
//

import SwiftUI

enum ButtonStyle {
    case primary
    case primaryDisabled
    case secondaryUnfilled
    case secondaryFilled
    case secondaryDisabled
}


struct DMButton: View {
    let buttonText: String
    let buttonStyle: ButtonStyle
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonText)
                .foregroundStyle(textColor)
                .font(.system(size: fontSize, weight: .semibold))
                .padding(.vertical, verticalPadding)
                .padding(.horizontal, horizontalPadding)
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundStyle(backgroundColor)
                        .cornerRadius(20, corners: [.topRight, .bottomLeft])
                )
        }
    }
    
    var verticalPadding: CGFloat {
        switch buttonStyle {
        case .primary, .primaryDisabled:
            10
        case .secondaryUnfilled, .secondaryFilled, .secondaryDisabled:
            8
        }
    }
    
    var horizontalPadding: CGFloat {
        switch buttonStyle {
        case .primary, .primaryDisabled:
            24
        case .secondaryUnfilled, .secondaryFilled, .secondaryDisabled:
            16
        }
    }
    
    var backgroundColor: Color {
        switch buttonStyle {
        case .primary:
                .myPrimary
        case .primaryDisabled:
                .myGray
        case .secondaryUnfilled, .secondaryDisabled:
                .clear
        case .secondaryFilled:
                .mySecondary.opacity(0.1)
        }
    }
    
    var textColor: Color {
        switch buttonStyle {
        case .primary:
                .black87
        case .primaryDisabled, .secondaryDisabled:
                .black48
        case .secondaryUnfilled, .secondaryFilled:
            .mySecondary
        }
    }
    
    var fontSize: CGFloat {
        switch buttonStyle {
        case .primary, .primaryDisabled:
            18
        case .secondaryUnfilled, .secondaryFilled, .secondaryDisabled:
            16
        }
    }
    
}
