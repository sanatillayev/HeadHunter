//
//  EmailVerificationViewModel.swift
//
//
//  Created by Bilol Sanatillayev on 18/03/24.
//

import SwiftUI
import Combine

final class EmailVerificationViewModel: ObservableObject {
    
    // MARK: Public Properties
    @Published private(set) var state: State!
    let action = PassthroughSubject<Action, Never>()
    
    // MARK: Private properties

    private var subscriptions = Set<AnyCancellable>()

    // MARK: Init

    init(email: String) {
        self.state = State(email: email)
        action
            .sink(receiveValue: { [unowned self] in
                self.didChange($0)
            })
            .store(in: &subscriptions)
    }

    // MARK: Private Methods

    private func didChange(_ action: Action) {
        switch action {
        case .checkVerificationNumber(_):
            // TODO: check and go to next screen
            print("")
        case .setOtp(let otp):
            self.state.verification = otp
        }
    }
    
    private func checkVerificationNumber() {
        
    }
}

// MARK: - ViewModel Actions & State

extension EmailVerificationViewModel {

    enum Action {
        case checkVerificationNumber(Int)
        case setOtp(String)

    }

    struct State {
        
        var isLoading = false
        var verification: String = ""
        var email: String
    }
}
