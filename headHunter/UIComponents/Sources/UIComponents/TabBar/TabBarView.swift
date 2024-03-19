//
//  TabBarView.swift
//
//
//  Created by Bilol Sanatillayev on 14/03/24.
//

import SwiftUI

private enum Constants {
    static let barHeight: CGFloat = 84.0
    static let barContentBottom: CGFloat = 36.0
    static let titleFont = Font.system(size: 10.0, weight: .medium)
    
    static let selectedColor = Color.AppColors.clBaseBlue
    static let nonSeletectedColor = Color.AppColors.clLabelDisabled

    static let horizontalPadding: CGFloat = 15.0

    static func iconColor(_ isSelected: Bool = false) -> Color {
        isSelected ? selectedColor : nonSeletectedColor
    }
}

public struct TabBarView: View {

    @Binding var selectedSection: TabSection

    public init(selectedSection: Binding<TabSection>) {
        _selectedSection = selectedSection
    }

    public var body: some View {
        VStack(spacing: .zero) {
            Divider()
            HStack(spacing: .zero) {
                Spacer()
                button(for: .search)
                Spacer()
                button(for: .favorite)
                Spacer()
                button(for: .applied)
                Spacer()
                button(for: .chat)
                Spacer()
                button(for: .profile)
                Spacer()
            }
        }
        .background{
            Color.AppColors.clBackgroundPrimary
                .ignoresSafeArea()
        }
    }

    private func button(for tabSection: TabSection) -> some View {
        Button(action: { handleButtonTap(on: tabSection) }) {
            let color = Constants.iconColor(selectedSection == tabSection)
            VStack(spacing: .zero) {
                foregroundIconStyle(for: tabSection)
                    .mask(Image(tabSection.iconName))
                Spacer()
                Text(tabSection.tabTitle)
                    .foregroundColor(color)
                    .font(Constants.titleFont)
            }
            .padding(.top, 10)
        }
        .frame(height: 50)
    }
    
    @ViewBuilder
    private func foregroundIconStyle(for tab: TabSection) -> some View {
        if tab == selectedSection {
            Color.AppColors.clBaseBlue
        } else {
            Constants.nonSeletectedColor
        }
    }
}

// MARK: - View Actions
private extension TabBarView {

    private func handleButtonTap(on section: TabSection) {
        guard selectedSection != section else { return }
        selectedSection = section
    }
}
