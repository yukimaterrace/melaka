//
//  Font+Custom.swift
//  Melaka
//
//  Created by Yuki Matsuo on 2023/05/28.
//

import SwiftUI

extension SwiftUI.Font {

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

    static func hiragino(_ type: HiraginoType, size: CGFloat) -> SwiftUI.Font {
        .custom(type.rawValue, size: size)
    }

    static func fontAwesome(_ type: FontAwesomeType, size: CGFloat) -> SwiftUI.Font {
        let font: FontConvertible
        switch type {
        case .regular:
            font = FontFamily.FontAwesome6Free.regular
        case .solid:
            font = FontFamily.FontAwesome6Free.solid
        case .brands:
            font = FontFamily.FontAwesome6Brands.regular
        }
        return .custom(font, size: size)
    }
}
