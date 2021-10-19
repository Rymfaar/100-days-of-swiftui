//
//  ContentView.swift
//  WordScramble
//
//  Created by Alexis Beaudoin on 12/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle
            if let fileContents = try? String(contentsOf: fileURL) {
                // try? automatically catches the thrown error and makes the return nil.
                // loaded the file in string.
            }
        }
        Text("Hello world").padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
