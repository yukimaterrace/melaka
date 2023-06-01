//
//  ViewFactory.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/30.
//

import Foundation

public enum ViewFactory {
    static func resolveDependency<T>(_ type: T.Type) -> T {
        DIContainer.instance.resolve(type)!
    }
}
