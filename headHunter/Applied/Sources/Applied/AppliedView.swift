//
//  AppliedView.swift
//
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI
import UIComponents

struct AppliedView: View {
    var body: some View {
        ZStack {
            Color.AppColors.clBackgroundPrimary.ignoresSafeArea()
            Text("Applied View!")
                .foregroundStyle(Color.AppColors.clLabelPrimary)
        }
    }
}

