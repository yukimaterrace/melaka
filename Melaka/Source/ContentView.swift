//
//  ContentView.swift
//  Melaka
//
//  Created by 松尾 勇気（Yuki Matsuo） on 2023/05/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("github")
                .font(.fontAwesome(.brands, size: 40))
            Text("Hello, world!")
                .font(.hiragino(.w3, size: 32))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
