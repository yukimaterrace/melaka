//
//  LoginInteractorTests.swift
//  MelakaTests
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/30.
//

@testable import Melaka
import API
import XCTest

class LoginInteractorTests: XCTestCase {

    func test() async throws {
        let interactor = LoginInteractor(networkService: StubNetworkService())
        _ = try await interactor.login(email: "email", password: "password")
    }
}
