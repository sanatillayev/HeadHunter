//
//  ProfileView.swift
//
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI
import UIComponents
import Auth

struct ProfileView: View {
    private var appState: AppStateManager
    init(appState: AppStateManager) {
        self.appState = appState
    }
    var body: some View {
        ZStack() {
            Color.AppColors.clBackgroundPrimary.ignoresSafeArea()
            
            VStack( spacing: 20) {
                Text("Profile, view!")
                    .foregroundStyle(Color.AppColors.clLabelPrimary)
                BlueButtonView(title: "Log out") {
                    appState.performLogout()
                }
            }
            
        }
    }
}
