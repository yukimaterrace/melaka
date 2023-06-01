//
//  MelakaApp.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/17.
//

import App
import SwiftUI

@main
struct MelakaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ViewFactory.createRoot()
        }
    }
}
