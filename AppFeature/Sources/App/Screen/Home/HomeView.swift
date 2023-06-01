//
//  HomeView.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/17.
//

import SwiftUI

public struct HomeView: View {
    public var body: some View {
        VStack {
            Text("github")
                .font(.fontAwesome(.brands, size: 40))
            Text("Hello, world!")
                .font(.hiragino(.w3, size: 32))
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
