//
//  LoginResponseTests.swift
//  API
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/06/02.
//

@testable import API
import XCTest

class LoginResponseTests: XCTestCase {

    func testDecodable() throws {
        let json = """
        {
            "token": "token",
            "user_id": 1
        }
        """
        let data = json.data(using: .utf8)!
        let response = try JSONDecoder().decode(LoginResponse.self, from: data)
        XCTAssertEqual(response.token, "token")
        XCTAssertEqual(response.userId, 1)
    }
}
