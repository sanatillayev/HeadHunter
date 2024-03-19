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

    /// Selection tab by default
    @Binding var selectedSection: TabSection
    private let addButtonTapped: () -> Void

    public init(selectedSection: Binding<TabSection>, addButtonTapped: @escaping () -> Void) {
        _selectedSection = selectedSection
        self.addButtonTapped = addButtonTapped
    }

    public var body: some View {
        VStack(spacing: .zero) {
            Divider()
            HStack(spacing: .zero) {
                Spacer()
                button(for: .search)
                Spacer()
                button(for: .favorites)
                Spacer()
                button(for: .applied)
                Spacer()
                button(for: .chat)
                Spacer()
                button(for: .profile)
                Spacer()
            }
        }
        .background(Material.bar)
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
        }
        .frame(height: 40)
    }
    
    @ViewBuilder
    private func foregroundIconStyle(for tab: TabSection) -> some View {
        if tab == selectedSection {
            
        } else {
            Constants.nonSeletectedColor.opacity(0.8)
        }
    }
}

// MARK: - View Actions
private extension TabBarView {

    private func handleButtonTap(on section: TabSection) {
        guard selectedSection != section else {
            return
        }
        selectedSection = section
    }
}
