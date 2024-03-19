//
//  LoginView.swift
//
//
//  Created by Bilol Sanatillayev on 17/03/24.
//

import SwiftUI
import UIComponents
import Router

private enum Constants {
    static let title: String = "Вход в личный кабинет"
    static let titleFont = Font.system(size: 20, weight: .semibold)
    static let cornerRadius: CGFloat = 8
    
    enum Login {
        static let title = "Поиск работы"
        static let textFieldPlaceholder = "Электронная почта или телефон"
        static let caption = "invalid email"
        static let buttonTitle = "Продолжить"
        static let loginWithPasswordTitle = "Войти с паролем"

        static let titleFont = Font.system(size: 16, weight: .medium)
        static let subtitleFont = Font.system(size: 14, weight: .regular)
    }
    enum Talent {
        static let title = "Поиск сотрудников"
        static let subtitle = "Размещение вакансий и доступ к базе резюме"
        static let buttonTitle = "Я ищу сотрудников"
    }
}

struct LoginView: View {
    @EnvironmentObject private var router: Router
    @StateObject var viewModel: LoginViewModel
    
    init() {
        _viewModel = .init(wrappedValue: LoginViewModel())
    }

    var body: some View {
        ZStack {
            Color.AppColors.clBackgroundPrimary
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16) {
                titleView
                Spacer()
                jobFindView
                talentFindView
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden()
    }
}

extension LoginView {
    private var titleView: some View {
        Text(Constants.title)
            .font(Constants.titleFont)
            .foregroundStyle(Color.AppColors.clLabelPrimary)
            .padding(.top, 32)
    }
    private var jobFindView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(Constants.Login.title)
                .font(Constants.Login.titleFont)
                .foregroundStyle(Color.AppColors.clLabelPrimary)
            textFieldView
            continueButtonView
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .background(Color.AppColors.clBackgroundSecondary)
        .cornerRadius(Constants.cornerRadius)
    }
    
    private var textFieldView: some View {
        EmailFieldView(text: emailBinding,
                  placeholder: Constants.Login.textFieldPlaceholder,
                       caption: Constants.Login.caption, isValid: isValidEmailBinding) {
            Image(String.Images.iconApplied)
                .foregroundColor(Color.AppColors.clLabelDisabled)
        } trailingContent: {
            Button {
                viewModel.action.send(.setEmail(""))
                viewModel.action.send(.setIsValidEmail(true))
            } label: {
                Image(String.Images.iconX)
                    .foregroundColor(Color.AppColors.clLabelPrimary)
            }
        }
    }
    
    private var continueButtonView: some View {
        HStack(spacing: 24) {
            BlueButtonView(title: Constants.Login.buttonTitle,
                           isButtonDisable: viewModel.state.email.isEmpty, isSmall: true) {
                viewModel.action.send(.checkMailValidation)
                if viewModel.state.isValidEmail {
                    router.navigate(to: Destination.emailVerification(email: viewModel.state.email))
                }
            }
            
            Button(action: {
                // Login with password
            }, label: {
                Text(Constants.Login.loginWithPasswordTitle)
                    .font(Constants.Login.subtitleFont)
            })
        }
    }
    
    private var talentFindView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(Constants.Talent.title)
                .font(Constants.Login.titleFont)
            Text(Constants.Talent.subtitle)
                .font(Constants.Login.subtitleFont)
            GreenButtonView(title: Constants.Talent.buttonTitle, isButtonDisable: false) {
                
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .foregroundStyle(Color.AppColors.clLabelPrimary)
        .background(Color.AppColors.clBackgroundSecondary)
        .cornerRadius(Constants.cornerRadius)
    }
    
}
// MARK: - Binding
private extension LoginView {
    
    private var emailBinding: Binding<String> {
        Binding {
            viewModel.state.email
        } set: { newEmail in
            viewModel.action.send(.setEmail(newEmail))
        }
    }
    
    private var isValidEmailBinding: Binding<Bool> {
        Binding {
            viewModel.state.isValidEmail
        } set: { isValidEmail in
            viewModel.action.send(.setIsValidEmail(isValidEmail))
        }
    }
    
    
}
