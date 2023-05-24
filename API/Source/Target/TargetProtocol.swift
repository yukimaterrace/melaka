//
//  TargetProtocol.swift
//  API
//
//  Created by Yuki Matsuo on 2023/05/23.
//

import Alamofire
import Foundation

public protocol TargetProtocol {
    associatedtype Response: Decodable
    associatedtype RequestBody: Encodable

    var method: HTTPMethod { get }
    var path: String { get }
    var queries: [URLQueryItem]? { get }
    var headers: HTTPHeaders? { get }
    var requestBody: RequestBody? { get }
    var responseType: Response.Type { get }
}
