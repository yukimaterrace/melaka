//
//  DIContainer.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/24.
//

import API
import Domain
import Foundation
import Swinject

class DIContainer {
    static let instance = Container()

    static func initialize() {
        initializeNetworkService()
    }

    private static func initializeNetworkService() {
        instance.register(NetworkServiceProtocol.self) { _ in
            NetworkService(baseUrl: Environment.apiBaseUrl)
        }.inObjectScope(.container)
    }
}
