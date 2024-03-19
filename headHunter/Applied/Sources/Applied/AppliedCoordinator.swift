//
//  AppliedCoordinator.swift
//
//
//  Created by Bilol Sanatillayev on 15/03/24.
//

import SwiftUI

public struct AppliedCoordinator: View {
    public init() {}
    public var body: some View {
        AppliedView()
            .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    AppliedCoordinator()
}
