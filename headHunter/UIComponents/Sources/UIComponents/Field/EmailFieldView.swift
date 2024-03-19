//
//  SwiftUIView.swift
//  
//
//  Created by Bilol Sanatillayev on 17/03/24.
//

import SwiftUI

private enum Constants {
    static let vSpacing: CGFloat = 8.0
    static let titleFont = Font.system(size: 13.0, weight: .regular)
    static let fieldFont = Font.system(size: 17.0, weight: .regular)
    static let padding: CGFloat = 12.0
    static let cornerRadius: CGFloat = 8.0
    static let hOffset: CGFloat = 16.0
    static let hSpacing: CGFloat = 4.0
    static let fieldHeight: CGFloat = 40
    static let textVPadding: CGFloat = 11.0
}



public struct EmailFieldView<Leading, Trailing>: View where Leading: View,  Trailing: View {

    private let placeholder: String
    private let axis: Axis
    private let caption: String?
    private let leadingContent: (() -> Leading)?
    private let trailingContent: (() -> Trailing)?
    @Binding var text: String
    @Binding private var isValid: Bool
    
    public init(
        text: Binding<String>,
        placeholder: String = "",
        caption: String? = nil,
        axis: Axis = .horizontal
    ) where Trailing == EmptyView, Leading == EmptyView {
        self._text = text
        self.placeholder = placeholder
        self.caption = caption
        self._isValid = Binding.constant(true)
        self.axis = axis
        self.leadingContent = nil
        self.trailingContent = nil

    }
    
    public init(
        text: Binding<String>,
        placeholder: String = "",
        caption: String? = nil,
        isValid: Binding<Bool>,
        @ViewBuilder leadingContent: @escaping () -> Leading,
        @ViewBuilder trailingContent: @escaping () -> Trailing
    ) {
        self._text = text
        self.placeholder = placeholder
        self.caption = caption
        self.axis = .horizontal
        self._isValid = isValid
        self.leadingContent = leadingContent
        self.trailingContent = trailingContent
    }
    
    private var textLimit: Int {
        axis == .vertical ? 10000 : 250
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.vSpacing) {
            HStack(alignment: .center, spacing: Constants.hSpacing) {
                if text.isEmpty {
                    leadingContent?()
                }
                textField
                    .padding(.vertical, Constants.textVPadding)
                if !text.isEmpty {
                    trailingContent?()
                }
            }
            .padding(.horizontal, Constants.padding)
            .frame(height: Constants.fieldHeight)
            .background(
                ZStack(content: {
                    Color.AppColors.clRed
                    Color.AppColors.clBackgroundTertiary
                        .cornerRadius(Constants.cornerRadius)
                        .padding(.all, isValid ? 0 : 1)

                })
                    .cornerRadius(Constants.cornerRadius)
                
            )
            .cornerRadius(Constants.cornerRadius)

            if let caption, !isValid {
                Text(caption)
                    .font(Constants.titleFont)
                    .foregroundColor(Color.AppColors.clRed)
            }
        }
    }
    
    var textField: some View {
        TextField("", text: limitedTextBinding)
            .font(Constants.fieldFont)
            .foregroundColor(Color.AppColors.clLabelPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundStyle(Color.AppColors.clLabelDisabled)
                }
            }
            .keyboardType(.emailAddress)
    }
    
    private var limitedTextBinding: Binding<String> {
        Binding {
            self.text
        } set: { newText in
            if newText.count <= textLimit {
                self.text = newText
            }
        }
    }
}
