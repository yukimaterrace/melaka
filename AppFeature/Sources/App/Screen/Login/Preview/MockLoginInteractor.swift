//
//  MockLoginInteractor.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/30.
//

import API
import Domain
import Foundation

class MockLoginInteractor: LoginInteractorProtocol {

    func login(email: String, password: String) async throws -> Token {
        .init(token: "", userId: 1)
    }
}
