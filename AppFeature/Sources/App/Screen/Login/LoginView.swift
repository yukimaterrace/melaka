//
//  LoginView.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/29.
//

import API
import SwiftUI

extension ViewFactory {
    static func createLogin() -> some View {
        let networkService = resolveDependency(NetworkServiceProtocol.self)
        let sessionState = resolveDependency(SessionState.self)
        let interactor = LoginInteractor(networkService: networkService)
        let viewModel = LoginViewModel(interactor: interactor,
                                       alertViewModel: .init(),
                                       sessionState: sessionState)
        return LoginView(viewModel: viewModel)
    }
}

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            LoginContentView(viewModel: viewModel)

            if viewModel.isLoading {
                LoadingView()
            }
        }
        .appAlert(viewModel: $viewModel.alertViewModel)
    }
}

struct LoginContentView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            Text(L10n.App.title)
                .font(.hiragino(.w6, size: 40))
                .foregroundColor(Asset.primary.swiftUIColor)

            TextField(L10n.Login.email, text: $viewModel.email)
                .font(.hiragino(.w3, size: 16))
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.top, 50)

            SecureField(L10n.Login.password, text: $viewModel.password)
                .font(.hiragino(.w3, size: 16))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)

            Button(action: { viewModel.login() }, label: {
                Text(L10n.Login.Button.title)
                    .font(.hiragino(.w6, size: 18))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
                    .background(Asset.primary.swiftUIColor)
            })
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding(.horizontal)
            .padding(.top, 30)
            .disabled(viewModel.isLoading)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LoginViewModel(interactor: MockLoginInteractor(),
                                       alertViewModel: .init(),
                                       sessionState: .init())
        LoginView(viewModel: viewModel)
    }
}
