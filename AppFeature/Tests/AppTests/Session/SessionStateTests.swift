//
//  SessionStateTests.swift
//  MelakaTests
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/30.
//

@testable import App
import Combine
import XCTest

class SessionStateTests: XCTestCase {

    func test() {
        let sessionState = SessionState()

        sessionState.loggedIn(accessToken: "abc")
        XCTAssertTrue(sessionState.isLoggedIn)
        XCTAssertEqual(sessionState.accessToken, "abc")

        sessionState.loggedOut()
        XCTAssertFalse(sessionState.isLoggedIn)
        XCTAssertNil(sessionState.accessToken)
    }
}
