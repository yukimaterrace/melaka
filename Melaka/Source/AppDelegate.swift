//
//  AppDelegate.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/25.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DIContainer.initialize()
        return true
    }
}
