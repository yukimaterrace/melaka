//
//  LoginRequest.swift
//  API
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/24.
//

import Foundation

public struct LoginRequest: Encodable {
    public let email: String
    public let password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
