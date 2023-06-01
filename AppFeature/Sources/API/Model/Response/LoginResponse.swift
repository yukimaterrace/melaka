//
//  LoginResponse.swift
//  API
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/24.
//

import Foundation

public struct LoginResponse: Codable {
    public let token: String
    public let userId: Int

    enum CodingKeys: String, CodingKey {
        case token
        case userId = "user_id"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.token = try container.decode(String.self, forKey: .token)
        self.userId = try container.decode(Int.self, forKey: .userId)
    }

    public init(token: String, userId: Int) {
        self.token = token
        self.userId = userId
    }
}
