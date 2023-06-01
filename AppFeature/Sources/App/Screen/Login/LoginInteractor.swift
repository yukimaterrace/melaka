//
//  LoginInteractor.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/29.
//

import API
import Foundation

protocol LoginInteractorProtocol {
    func login(email: String, password: String) async throws -> LoginResponse
}

class LoginInteractor: LoginInteractorProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func login(email: String, password: String) async throws -> LoginResponse {
        let target = LoginTarget(requestBody: .init(email: email, password: password))
        return try await networkService.request(target: target)
    }
}
