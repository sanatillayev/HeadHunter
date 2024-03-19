//
//  ChatView.swift
//
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI
import UIComponents

struct ChatView: View {
    var body: some View {
        ZStack {
            Color.AppColors.clBackgroundPrimary.ignoresSafeArea()
            Text("Chat view!")
                .foregroundStyle(Color.AppColors.clLabelPrimary)

        }
    }
}
