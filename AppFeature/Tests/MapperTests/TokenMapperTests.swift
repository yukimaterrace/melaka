//
//  TokenMapperTests.swift
//  MapperTests
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/06/02.
//

@testable import Mapper
@testable import Domain
@testable import API
import XCTest

class TokenMapperTests: XCTestCase {

    func testMap() {
        let loginResponse = LoginResponse(token: "token", userId: 1)
        let token = TokenMapper.map(loginResponse)

        XCTAssertEqual(token.token, "token")
        XCTAssertEqual(token.userId, 1)
    }
}
