//
//  Font+Custom.swift
//  Melaka
//
//  Created by Yuki Matsuo on 2023/05/28.
//

import SwiftUI
import RswiftResources

extension Font {

    // swiftlint:disable identifier_name
    enum HiraginoType: String {
        case w3 = "HiraginoSans-W3"
        case w6 = "HiraginoSans-W6"
    }
    // swiftlint:enable identifier_name

    enum FontAwesomeType {
        case regular
        case solid
        case brands
    }

    static func hiragino(_ type: HiraginoType, size: CGFloat) -> Font {
        .custom(type.rawValue, size: size)
    }

    static func fontAwesome(_ type: FontAwesomeType, size: CGFloat) -> Font {
        let resource: RswiftResources.FontResource
        switch type {
        case .regular:
            resource = R.font.fontAwesome6FreeRegular
        case .solid:
            resource = R.font.fontAwesome6FreeSolid
        case .brands:
            resource = R.font.fontAwesome6BrandsRegular
        }
        return .custom(resource, size: size)
    }
}
