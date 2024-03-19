//
//  HHMainCoordinator.swift
//  headHunter
//
//  Created by Bilol Sanatillayev on 19/03/24.
//

import SwiftUI
import Auth
import Login

public struct HHMainCoordinator: View {
    private var appState: AppStateManager

    public init(appState: AppStateManager) {
        self.appState = appState
    }
    
    public var body: some View {
        HHMainView(appState: appState)
    }
}

