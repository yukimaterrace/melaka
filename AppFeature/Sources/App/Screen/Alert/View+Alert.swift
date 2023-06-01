//
//  View+Alert.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/30.
//

import SwiftUI

extension View {

    func appAlert(viewModel: Binding<AlertViewModel>) -> some View {
        alert(
            viewModel.wrappedValue.alertTitle,
            isPresented: viewModel.isError,
            actions: {
                Button(L10n.Alert.Button.close) {
                    viewModel.wrappedValue.isError = false
                }
            },
            message: {
                Text(viewModel.wrappedValue.alertMessage)
                    .font(.hiragino(.w3, size: 14))
            }
        )
    }
}
