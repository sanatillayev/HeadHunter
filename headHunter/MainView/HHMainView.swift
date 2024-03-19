//
//  HHMainView.swift
//  headHunter
//
//  Created by Bilol Sanatillayev on 14/03/24.
//

import SwiftUI
import UIComponents
import Applied
import Chat
import Profile
import Login
import Combine
import Router
import Search
import Favorite
import Auth

struct HHMainView: View {
    
    private var appState: AppStateManager
    @State private var selectedTabSection: TabSection = .search
    @EnvironmentObject var router: Router
    
    init(appState: AppStateManager) {
        self.appState = appState
    }

    var body: some View {
        NavigationStack(path: $router.navPath) {
            VStack{
                TabView(selection: $selectedTabSection) {
                    ForEach(TabSection.allCases, id: \.hashValue) { tab in
                        createTab(for: tab)
                            .tag(tab)
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    TabBarView(selectedSection: $selectedTabSection)
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
    
    
    @ViewBuilder
    func createTab(for tab: TabSection) -> some View {
        if appState.authState == .notAuthorize {
            LoginCoordinator(appState: appState)
        } else {
            switch tab {
            case .search:
                SearchCoordinator()
            case .favorite:
                FavoriteCoordinator()
            case .applied:
                AppliedCoordinator()
            case .chat:
                ChatCoordinator()
            case .profile:
                ProfileCoordinator(appState: appState)
            }
        }
    }
}

