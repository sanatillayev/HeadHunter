//
//  LoginCoordinator.swift
//
//
//  Created by Bilol Sanatillayev on 17/03/24.
//

import SwiftUI
import Router
import Search
import Auth

enum Destination: Hashable {
    case emailVerification(email: String)
}

public struct LoginCoordinator: View {
    private var appState: AppStateManager
    
    public init(appState: AppStateManager) {
        self.appState = appState
    }
    
    public var body: some View {
        LoginView()
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case let .emailVerification(email):
                    EmailVerificationCoordinator(appState: appState, email: email)
                }
            }
    }
}
