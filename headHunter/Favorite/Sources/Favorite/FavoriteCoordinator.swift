//
//  FavoriteCoordinator.swift
//
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI

public enum FavoriteDestination: Hashable {
    case jobDetail(id: String)
    
}

public struct FavoriteCoordinator: View {
//    private let dependencies: Dependencies
//
    public init() {    }

    public var body: some View {
        FavoriteView()
            .navigationDestination(for: FavoriteDestination.self) { destination in
                Text(" favptire destination")
            }
    }
}

