//
//  MockLoginInteractor.swift
//  MelakaTests
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/30.
//

@testable import Melaka
import API
import Foundation

class MockLoginInteractor: LoginInteractorProtocol {
    var error: Error?

    func login(email: String, password: String) async throws -> LoginResponse {
        if let error { throw error }
        return .init(token: "token", userId: 1)
    }
}
