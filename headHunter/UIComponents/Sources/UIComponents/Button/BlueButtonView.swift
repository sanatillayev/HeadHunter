//
//  BlueButtonView.swift
//
//
//  Created by Bilol Sanatillayev on 18/03/24.
//

import SwiftUI

private enum Constants {
    static let smallFont = Font.system(size: 14, weight: .regular)
    static let font = Font.system(size: 16, weight: .semibold)

    static let cornerRadius: CGFloat = 8.0
    static let height: CGFloat = 48.0
    static let smallHeight: CGFloat = 40.0

    static let color = Color.AppColors.clBaseBlue
}

public struct BlueButtonView: View {
    
    private let title: String
    private let isDisabled: Bool
    private let isSmall: Bool
    private let action: () -> Void

    public init(
        title: String,
        isButtonDisable: Bool = false,
        isSmall: Bool = false,
        continueAction: @escaping () -> Void
    ) {
        self.title = title
        self.isDisabled = isButtonDisable
        self.isSmall = isSmall
        self.action = continueAction
    }
    
    @ViewBuilder
    private var background: some View {
        if isDisabled {
            Color.AppColors.clDarkBlue
        } else {
            Color.AppColors.clBaseBlue
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
                        .font(isSmall ? Constants.smallFont : Constants.font)
                        .foregroundStyle(foreground)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                Spacer()
            }
        }
        .frame(height: isSmall ? Constants.smallHeight : Constants.height)
        .background(background)
        .disabled(isDisabled)
        .cornerRadius(Constants.cornerRadius)
    }
}
