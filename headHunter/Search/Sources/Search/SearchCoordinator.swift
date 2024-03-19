//
//  SearchCoordinator.swift
//  
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI
import Router

public enum SearchDestination: Hashable {
    case search
//    case jobDetail(id: String)
    
}

public struct SearchCoordinator: View {

    public init() { }

    public var body: some View {
        SearchView()
            .navigationDestination(for: SearchDestination.self) { _ in
                Text("search destination")
            }
    }
}




