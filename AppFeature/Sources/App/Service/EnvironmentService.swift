//
//  EnvironmentService.swift
//  Melaka
//
//  Created by Yuki Matsuo on 2023/05/28.
//

import Domain
import Foundation

class EnvironmentService: EnvironmentServiceProtocol {

    var apiBaseUrl: URL {
        .init(string: PlistFiles.apiBaseUrl)!
    }
}
