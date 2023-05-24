//
//  MockTarget.swift
//  NetworkTests
//
//  Created by Yuki Matsuo on 2023/05/24.
//

@testable import API
import Alamofire
import Foundation

struct MockTargetResponse: Decodable {
    let xxx: String
}

struct MockTargetRequestBody: Encodable {}

class MockTarget: TargetProtocol {
    typealias Response = MockTargetResponse
    typealias RequestBody = MockTargetRequestBody

    var method: Alamofire.HTTPMethod = .get

    var path: String = "/api/login"

    var queries: [URLQueryItem]?

    var headers: Alamofire.HTTPHeaders?

    var requestBody: MockTargetRequestBody? = .init()

    var responseType: MockTargetResponse.Type = MockTargetResponse.self
}
