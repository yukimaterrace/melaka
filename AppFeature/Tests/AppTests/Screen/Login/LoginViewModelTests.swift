//
//  LoginViewModelTests.swift
//  MelakaTests
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/30.
//

@testable import App
import API
import Combine
import SwiftUI
import XCTest

class LoginViewModelTests: XCTestCase {
    class MockError: Error {}

    func test() {
        let interactor = MockLoginInteractor()
        let viewModel = LoginViewModel(interactor: interactor, alertViewModel: .init(), sessionState: .init())

        var cancellables = Set<AnyCancellable>()
        let expLoggedIn = expectation(description: #function)
        let expLoginFailed = expectation(description: #function)

        viewModel.sessionState.$isLoggedIn.sink { _ in
            expLoggedIn.fulfill()
        }.store(in: &cancellables)

        var count = 0
        viewModel.alertViewModel.$isError.sink { _ in
            count += 1
            if count == 2 {
                expLoginFailed.fulfill()
            }
        }.store(in: &cancellables)

        viewModel.login()

        interactor.error = MockError()
        viewModel.login()

        interactor.error = NetworkError(statusCode: 400, message: nil)
        viewModel.login()

        wait(for: [expLoggedIn, expLoginFailed], timeout: 1)
    }
}
