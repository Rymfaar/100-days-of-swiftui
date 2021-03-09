//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Alexis Beaudoin on 08/03/2021.
//

import SwiftUI

struct CustomText: View {
    var name: String
    
    var body: some View {
        Text("People call me \(name)!")
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.blue)
    }
}

extension View {
    func blueTitled() -> some View {
        self.modifier(BlueTitle())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack (alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .padding(5)
                .background(Color.black)
                .foregroundColor(Color.white)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    @State private var lineInRed = false
    
    private var line1 = Text("Hello, world!")
    private var line2: some View { Text("Hello, Twitter!") }
    
    var body: some View {
        VStack {
            Button(action: {
                self.lineInRed.toggle()
            }) {
                Text("Change color")
                    .foregroundColor(self.lineInRed ? .blue : .red)
            }
            line1
                .foregroundColor(self.lineInRed ? .red : .blue)
            line2
                .foregroundColor(self.lineInRed ? .red : .blue)
            CustomText(name: "Rym")
            Color.gray
                .frame(width: 200, height: 200)
                .watermarked(with: "Rymfire")
            Text("Fuck coronavirus")
                .blueTitled()
        }.blur(radius: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
