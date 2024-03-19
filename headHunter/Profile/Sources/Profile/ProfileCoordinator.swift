//
//  ProfileCoordinator.swift
//
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI
import Auth
import Login

public enum ProfileDestination: Hashable {
    case login
//    case jobDetail(id: String)
    
}

public struct ProfileCoordinator: View {
    private var appState: AppStateManager
    
    public init(appState: AppStateManager) {
        self.appState = appState
    }

    public var body: some View {
        ProfileView(appState: appState)
            .navigationDestination(for: ProfileDestination.self) { destionation in
                switch destionation {
                case .login:
                    LoginCoordinator(appState: appState)
                }
            }
    }
}
