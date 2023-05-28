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
        initializeEnvironmentService()
        initializeNetworkService()
    }

    private static func initializeEnvironmentService() {
        instance.register(EnvironmentServiceProtocol.self) { _ in
            EnvironmentService()
        }.inObjectScope(.container)
    }

    private static func initializeNetworkService() {
        instance.register(NetworkServiceProtocol.self) {
            let environment = $0.resolve(EnvironmentServiceProtocol.self)!
            return NetworkService(baseUrl: environment.apiBaseUrl)
        }.inObjectScope(.container)
    }
}
