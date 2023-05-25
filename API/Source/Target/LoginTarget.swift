//
//  LoginTarget.swift
//  API
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/24.
//

import Alamofire
import Foundation

public class LoginTarget: TargetProtocol {
    public typealias Response = LoginResponse
    public typealias RequestBody = LoginRequest

    public var method: Alamofire.HTTPMethod = .post

    public var path: String = "/api/login"

    public var queries: [URLQueryItem]?

    public var headers: Alamofire.HTTPHeaders?

    public var requestBody: LoginRequest?

    public var responseType: LoginResponse.Type = LoginResponse.self

    public init(requestBody: LoginRequest) {
        self.requestBody = requestBody
    }
}
