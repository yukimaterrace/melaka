//
//  NetworkService+HelperTests.swift
//  NetworkTests
//
//  Created by Yuki Matsuo on 2023/05/24.
//

@testable import API
import XCTest

final class NetworkServicePlusHelperTests: XCTestCase {
    var networkService: NetworkService!

    override func setUpWithError() throws {
        networkService = NetworkService(baseUrl: .init(string: "https://yukimaterrace.com")!)
    }

    func testCreateRequest() throws {
        let urlRequest = try networkService.createRequest(MockTarget())
        XCTAssertEqual(urlRequest.url?.absoluteString, "https://yukimaterrace.com/api/login")
    }

    func testCreateResponse() throws {
        let data = "{\"xxx\": \"abc\"}".data(using: .utf8)
        let response = try networkService.createResponse(MockTarget(), data: data!)
        XCTAssertEqual(response.xxx, "abc")
    }

    func testThrowNetworkError() {
        let data = "{\"error\": \"unauthorized\", \"exception\": \"exception raised\"}".data(using: .utf8)!
        do {
            try networkService.throwNetworkError(statusCode: 404, data: data)
            XCTFail()
        } catch {
            guard let error = error as? NetworkError else {
                XCTFail()
                return
            }
            XCTAssertEqual(error.statusCode, 404)
            XCTAssertEqual(error.message, "exception raised")
        }
    }
}
