//
//  RootView.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/29.
//

import SwiftUI

extension ViewFactory {
    static func createRoot() -> some View {
        let sessionState = resolveDependency(SessionState.self)
        return RootView(sessionState: sessionState)
    }
}

struct RootView: View {
    @ObservedObject var sessionState: SessionState

    var body: some View {
        if sessionState.isLoggedIn {
            HomeView()
        } else {
            ViewFactory.createLogin()
        }
    }
}
