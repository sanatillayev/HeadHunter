//
//  GreenButtonView.swift
//
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI

private enum Constants {
    static let font = Font.system(size: 17, weight: .semibold)
    static let cornerRadius: CGFloat = 60.0
    static let height: CGFloat = 50.0
    static let color = Color.AppColors.clGreen
}

public struct GreenButtonView: View {

    private let title: String
    private let isDisabled: Bool
    private let isOutlined: Bool
    private let action: () -> Void

    public init(
        title: String,
        isButtonDisable: Bool = false,
        isOutlined: Bool = false,
        continueAction: @escaping () -> Void
    ) {
        self.title = title
        self.isDisabled = isButtonDisable
        self.isOutlined = isOutlined
        self.action = continueAction
    }
    
    @ViewBuilder
    private var background: some View {
        if isOutlined {
            Color.white
        } else if isDisabled {
            Color.AppColors.clDarkBlue
        } else {
            Constants.color
        }
    }
    
    private var foreground: Color {
        if isOutlined && isDisabled {
            return Color.AppColors.clLabelPrimary
        } else if isOutlined{
            return Constants.color
        } else {
            return Color.white
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
        .overlay {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .inset(by: 0.5)
                .stroke(foreground, lineWidth: isOutlined ? 1 : 0)
        }
        .disabled(isDisabled)
        .cornerRadius(Constants.cornerRadius)
    }
}
