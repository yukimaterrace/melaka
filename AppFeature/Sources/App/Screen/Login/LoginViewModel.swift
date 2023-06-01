//
//  LoginViewModel.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/29.
//

import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    private let interactor: LoginInteractorProtocol
    private var cancellables = Set<AnyCancellable>()

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false

    @ObservedObject var alertViewModel: AlertViewModel
    @ObservedObject var sessionState: SessionState

    init(interactor: LoginInteractorProtocol,
         alertViewModel: AlertViewModel,
         sessionState: SessionState) {
        self.interactor = interactor
        self.alertViewModel = alertViewModel
        self.sessionState = sessionState
    }

    func login() {
        isLoading = true
        Task { @MainActor in
            do {
                let response = try await interactor.login(email: email, password: password)
                sessionState.loggedIn(accessToken: response.token)
            } catch {
                alertViewModel.send(error: error)
            }
            isLoading = false
        }
    }
}
