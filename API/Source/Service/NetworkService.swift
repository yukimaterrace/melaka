//
//  NetworkService.swift
//  API
//
//  Created by Yuki Matsuo on 2023/05/23.
//

import Alamofire
import Foundation

public protocol NetworkServiceProtocol {
    func request<T>(target: T) async throws -> T.Response where T: TargetProtocol
}

public class NetworkService: NetworkServiceProtocol {
    let baseUrl: URL

    public init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }

    public func request<T>(target: T) async throws -> T.Response where T: TargetProtocol {
        try await withCheckedThrowingContinuation { [unowned self] continuation in
            let urlRequest: URLRequest
            do {
                urlRequest = try self.createRequest(target)
            } catch {
                continuation.resume(throwing: error)
                return
            }

            AF.request(urlRequest).response {
                switch $0.result {
                case .success(let data):
                    guard let response = $0.response else { return }
                    do {
                        if let data, response.statusCode == 200 {
                            continuation.resume(returning: try self.createResponse(target, data: data))
                        } else {
                            try self.throwNetworkError(statusCode: response.statusCode, data: data)
                        }
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

public class StubNetworkService: NetworkServiceProtocol {

    public init() {}

    public func request<T>(target: T) async throws -> T.Response where T: TargetProtocol {
        target.sampleResponse
    }
}
