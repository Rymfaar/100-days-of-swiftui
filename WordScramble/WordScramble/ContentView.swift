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
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
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
                Spacer()
            }
            .navigationTitle(rootWord)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: resetRootWord) {
                        Text("Restart")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("\(self.score) points")
                }
            }
            .onAppear(perform: resetRootWord)
        }
        .alert(isPresented: $showingError) {
            Alert(title: Text(self.errorTitle), message: Text(self.errorMessage), dismissButton: .default(Text("OK")))
        }
    }

    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count >= 3 else {
            wordError(title: "Word \"\(answer)\" is too short", message: "Way too easy dude")
            self.newWord = ""
            return
        }
        guard answer.lowercased() != self.rootWord.lowercased() else {
            wordError(title: "This is the exact same word", message: "Come on...")
            self.newWord = ""
            return
        }
        guard isOriginal(word: answer) else {
            wordError(title: "Word \"\(answer)\" used already", message: "Be more original")
            self.newWord = ""
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Word \"\(answer)\" not recognized", message: "You can't juste make them up, you know !")
            self.newWord = ""
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word \"\(answer)\" not possible", message: "That isn't a real word")
            self.newWord = ""
            return
        }
        self.usedWords.insert(answer, at: 0)
        self.score += 10 * answer.count
        newWord = ""
    }
    
    func resetRootWord() { // Reset game session
        if let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // File was found
            if let fileContent = try? String(contentsOf: fileURL) {
                // File contains text
                let allRootWords = fileContent.components(separatedBy: "\n")
                self.rootWord = allRootWords.randomElement() ?? "silkworm"
                // Empty used words lists and text field (in case of restart)
                self.usedWords.removeAll()
                self.newWord = ""
                return
            }
        }
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool { //!!!: Check if word is real
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
    
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        self.errorTitle = title
        self.errorMessage = message
        self.showingError.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
