//
//  GreenButtonView.swift
//
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI

private enum Constants {
    static let font = Font.system(size: 14, weight: .regular)
    static let cornerRadius: CGFloat = 50.0
    static let height: CGFloat = 32.0
    static let color = Color.AppColors.clGreen
}

public struct GreenButtonView: View {

    private let title: String
    private let isDisabled: Bool
    private let action: () -> Void

    public init(
        title: String,
        isButtonDisable: Bool = false,
        continueAction: @escaping () -> Void
    ) {
        self.title = title
        self.isDisabled = isButtonDisable
        self.action = continueAction
    }
    
    @ViewBuilder
    private var background: some View {
        if isDisabled {
            Color.AppColors.clDarkGreen
        } else {
            Constants.color
        }
    }
    
    private var foreground: Color {
        if isDisabled {
            Color.AppColors.clLabelDisabled
        } else {
            Color.AppColors.clLabelPrimary
        }
        
    }

    public var body: some View {
        Button(action: action) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(title)
                        .font(Constants.font)
                        .foregroundStyle(foreground)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(height: Constants.height)
        .background(background)
        .disabled(isDisabled)
        .cornerRadius(Constants.cornerRadius)
    }
}
