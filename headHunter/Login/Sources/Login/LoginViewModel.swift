//
//  LoginViewModel.swift
//
//
//  Created by Bilol Sanatillayev on 17/03/24.
//

import SwiftUI
import Combine
import Router
import Auth


final class LoginViewModel: ObservableObject {
    
    // MARK: Public Properties
    @Published var state = State()
    let action = PassthroughSubject<Action, Never>()
    
    // MARK: Private properties

    private var subscriptions = Set<AnyCancellable>()

    // MARK: Init

    init() {
        
        action
            .sink(receiveValue: { [unowned self] in
                self.didChange($0)
            })
            .store(in: &subscriptions)
    }

    // MARK: Private Methods

    private func didChange(_ action: Action) {
        switch action {
        case .checkMailValidation:
            checkEmailValidation()
        case .setEmail(let email):
            self.state.email = email
            if !state.isValidEmail {
                self.state.isValidEmail = true
            }
        case .setIsValidEmail(let isValid):
            self.state.isValidEmail = isValid
        }
    }
    
    private func checkEmailValidation() {
        self.state.isValidEmail = state.email.isValidEmail(allowTopLevelDomains: true, allowInternational: false)
    }
    

}

// MARK: - ViewModel Actions & State

extension LoginViewModel {

    enum Action {
        case checkMailValidation
        case setEmail(String)
        case setIsValidEmail(Bool)
    }

    struct State {
        var isLoading = false
        var email: String = ""
        var isValidEmail: Bool = true

    }
}
