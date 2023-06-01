//
//  LoadingView.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/29.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        ProgressView()
            .scaleEffect(1.5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
    }
}
