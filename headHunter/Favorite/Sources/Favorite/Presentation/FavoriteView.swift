//
//  FavoriteView.swift
//
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI
import UIComponents

struct FavoriteView: View {
    var body: some View {
        ZStack {
            Color.AppColors.clBackgroundPrimary.ignoresSafeArea()
            Text("Favorite view!")
                .foregroundStyle(Color.AppColors.clLabelPrimary)
        }
    }
}
