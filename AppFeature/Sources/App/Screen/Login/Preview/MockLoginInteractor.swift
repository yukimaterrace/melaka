//
//  MockLoginInteractor.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/30.
//

import API
import Foundation

class MockLoginInteractor: LoginInteractorProtocol {

    func login(email: String, password: String) async throws -> LoginResponse {
        .init(token: "", userId: 1)
    }
}
