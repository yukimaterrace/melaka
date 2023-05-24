//
//  NetworkService+Helper.swift
//  API
//
//  Created by Yuki Matsuo on 2023/05/24.
//

import Alamofire
import Foundation

extension NetworkService {

    func createRequest<T>(_ target: T) throws -> URLRequest where T: TargetProtocol {
        let url = self.createUrl(target)
        let body = try self.createHttpBody(target)

        var urlRequest = try URLRequest(url: url, method: target.method, headers: target.headers)
        urlRequest.httpBody = body
        return urlRequest
    }

    func createUrl<T>(_ target: T) -> URLConvertible where T: TargetProtocol {
        var component = URLComponents()
        component.path = target.path
        component.queryItems = target.queries
        return component.url(relativeTo: baseUrl)!
    }

    func createHttpBody<T>(_ target: T) throws -> Data? where T: TargetProtocol {
        guard let requestBody = target.requestBody else { return nil }
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try JSONEncoder().encode(requestBody)
    }

    func createResponse<T>(_ target: T, data: Data) throws -> T.Response where T: TargetProtocol {
        return try JSONDecoder().decode(target.responseType, from: data)
    }

    func throwNetworkError(statusCode: Int, data: Data) throws {
        let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
        throw NetworkError(statusCode: statusCode, message: errorResponse.exception)
    }
}
