//
//  Token.swift
//  Domain
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/06/02.
//

import Foundation

public struct Token {
    public let token: String
    public let userId: Int

    public init(token: String, userId: Int) {
        self.token = token
        self.userId = userId
    }
}
