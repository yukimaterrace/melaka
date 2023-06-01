//
//  ErrorResponse.swift
//  API
//
//  Created by Yuki Matsuo on 2023/05/24.
//

import Foundation

public struct ErrorResponse: Decodable {
    public let error: String
    public let exception: String

    enum CodingKeys: CodingKey {
        case error
        case exception
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decode(String.self, forKey: .error)
        self.exception = try container.decode(String.self, forKey: .exception)
    }
}
