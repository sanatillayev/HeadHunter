//
//  EmailVerificationCoordinator.swift
//
//
//  Created by Bilol Sanatillayev on 18/03/24.
//

import SwiftUI
import Router
import Search
import Auth

public enum EmailVerificationDestination: Hashable {
    case search
}

struct EmailVerificationCoordinator: View {
    private var appState: AppStateManager
    private let email: String
    
    public init(appState: AppStateManager , email: String) {
        self.appState = appState
        self.email = email
    }

    var body: some View {
        EmailVerificationView(appState: appState , email: email)
            .navigationDestination(for: EmailVerificationDestination.self) { destination in
                switch destination {
                case .search:
                    SearchCoordinator()
                }
            }
    }
}
