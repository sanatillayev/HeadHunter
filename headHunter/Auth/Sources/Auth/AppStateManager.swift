//
//  File.swift
//  
//
//  Created by Bilol Sanatillayev on 19/03/24.
//

import Foundation
import CoreModel
import SwiftUI

public protocol AnyAppStateManager {
    func startSession(with email: String)
    func performLogout()
}

// MARK: - AppStateManager
final public class AppStateManager: ObservableObject, AnyAppStateManager {
    
    // MARK: Public properties
    @Published public private(set) var authState: AuthState = .notAuthorize
    @Published public private(set) var user: User?

    public init() { }
    public func notAuthorized() {
        self.authState = .notAuthorize
    }
    
    public func startSession(with email: String) {
        authState = .loggedIn
        user?.email = email
    }
    
    public func performLogout() {
        authState = .notAuthorize
    }
}

// MARK: - AuthState
public enum AuthState: Equatable {
    case loggedIn
    case notAuthorize
}

