//
//  SessionState.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/29.
//

import Foundation

class SessionState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var accessToken: String?

    func loggedIn(accessToken: String) {
        self.accessToken = accessToken
        isLoggedIn = true
    }

    func loggedOut() {
        accessToken = nil
        isLoggedIn = false
    }
}
