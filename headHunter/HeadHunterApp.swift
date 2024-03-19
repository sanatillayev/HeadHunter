//
//  headHunterApp.swift
//  headHunter
//
//  Created by Bilol Sanatillayev on 14/03/24.
//

import SwiftUI
import Router
import Auth
import Login

@main
struct headHunterApp: App {
    @StateObject var router = Router()
    @ObservedObject private var appState: AppStateManager

    init() {
        self.appState = AppStateManager()
    }
    var body: some Scene {
        WindowGroup {
            HHMainCoordinator(appState: appState)
                .environmentObject(router)
        }
    }
}
