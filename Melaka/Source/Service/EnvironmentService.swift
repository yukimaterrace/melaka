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
        .init(string: resolveString(key: "api_base_url"))!
    }

    func resolveString(key: String) -> String {
        guard let string = resolvedPlist[key] as? String else { exit(EXIT_FAILURE) }
        return string
    }

    var resolvedPlist: [String: Any] {
        guard let data = FileManager.default.contents(atPath: resolvedPath),
              let plist = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any] else {
            return [:]
        }
        return plist
    }

    var resolvedPath: String {
        let file = R.file.environmentPlist
        return R.bundle.path(forResource: file.name, ofType: file.pathExtension)!
    }
}
