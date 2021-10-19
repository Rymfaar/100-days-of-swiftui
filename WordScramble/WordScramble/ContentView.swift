//
//  ContentView.swift
//  WordScramble
//
//  Created by Alexis Beaudoin on 12/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var rootWord = ""
    @State private var usedWords = [String]()
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter new word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(.horizontal, 16)
                List (usedWords, id: \.self) { word in // FIXME: Grey background
                    HStack(alignment: .center) {
                        Image.init(systemName: "\(word.count).circle")
                        Text(word)
                    }
                }
            }
            .navigationTitle(rootWord)
            .onAppear(perform: resetRootWord)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        //TODO: extra validation to come
        usedWords.insert(answer, at: 0)
        newWord = ""
    }
    
    func resetRootWord() { // Reset game session
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // File was found
            if let fileContent = try? String(contentsOf: fileURL) {
                // File contains text
                let allRootWords = fileContent.components(separatedBy: "\n")
                self.rootWord = allRootWords.randomElement() ?? "silkworm"
                //TODO: Empty usedWords
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
