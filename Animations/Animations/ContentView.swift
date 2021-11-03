//
//  ContentView.swift
//  Animations
//
//  Created by Alexis Beaudoin on 03/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0

    var body: some View {
        Button("Tap me!") {
            withAnimation {
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(self.animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
