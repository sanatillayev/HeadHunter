//
//  EmailVerificationView.swift
//
//
//  Created by Bilol Sanatillayev on 18/03/24.
//

import SwiftUI
import UIComponents
import Router
import Search
import Auth

private enum Constants {
    static let title: String = "Отправили код на"
    static let subtitle = "Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет"
    static let titleFont = Font.system(size: 20, weight: .semibold)
    static let subtitleFont = Font.system(size: 16, weight: .medium)
    static let buttonTitle: String = "Подтвердить"

}

struct EmailVerificationView: View {
    private var appState: AppStateManager
    @EnvironmentObject var router: Router
    @StateObject var viewModel: EmailVerificationViewModel
    
    init(appState: AppStateManager ,email: String) {
        self.appState = appState
        _viewModel = .init(wrappedValue: EmailVerificationViewModel(email: email))
    }
    
    var body: some View {
        ZStack {
            Color.AppColors.clBackgroundPrimary.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("\(Constants.title) \(viewModel.state.email)")
                    .font(Constants.titleFont)
                    .foregroundStyle(Color.AppColors.clLabelPrimary)
                Text(Constants.subtitle)
                    .font(Constants.subtitleFont)
                    .foregroundStyle(Color.AppColors.clLabelPrimary)
                OTPFieldView(numberOfFields: 4, otp: otpBinding)
                BlueButtonView(title: Constants.buttonTitle, isButtonDisable: viewModel.state.verification.isEmpty, isSmall: false) {
//                    router.navigate(to: EmailVerificationDestination.search )
                    appState.startSession(with: viewModel.state.email)

                    router.navigateToRoot()
                }
            }
            .padding(.horizontal, 16)
        }
        .navigationBarBackButtonHidden()
    }
}
// Bindings
extension EmailVerificationView {
    
    private var otpBinding: Binding<String> {
        Binding {
            viewModel.state.verification
        } set: { newOtp in
            viewModel.action.send(.setOtp(newOtp))
        }
    }
   
}
