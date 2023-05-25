//
//  Environment.swift
//  Domain
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/24.
//

import Foundation

public enum Environment {
    class BundleClass {}

    public static var apiBaseUrl: URL {
        guard let apiBaseUrlString = Bundle(for: BundleClass.self).infoDictionary?["api_base_url"] as? String else {
            exit(EXIT_FAILURE)
        }
        return .init(string: apiBaseUrlString)!
    }
}
