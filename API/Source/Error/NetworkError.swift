//
//  NetworkError.swift
//  API
//
//  Created by Yuki Matsuo on 2023/05/23.
//

import Foundation

public class NetworkError: Error {
    public let statusCode: Int
    public let message: String?

    public init(statusCode: Int, message: String?) {
        self.statusCode = statusCode
        self.message = message
    }
}
