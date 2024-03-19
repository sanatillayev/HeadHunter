//
//  File.swift
//  
//
//  Created by Bilol Sanatillayev on 19/03/24.
//

import SwiftUI

public struct NavigationModifier: ViewModifier {

    @Binding public var presentingView: AnyView?

    public func body(content: Content) -> some View {
        content
            .navigationDestination(isPresented: isPresentedBinding, destination: {
                self.presentingView
            })
    }
    
    private var isPresentedBinding: Binding<Bool> {
        Binding(
            get: { self.presentingView != nil },
            set: { if !$0 { self.presentingView = nil } }
        )
    }
}
