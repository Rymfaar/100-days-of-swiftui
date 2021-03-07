//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Alexis Beaudoin on 24/02/2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var phoneTheme
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var scoreAlertTitle = ""

    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("GradientBackground0"), Color("GradientBackground1")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack (spacing: 32) {
                VStack {
                    Spacer()
                    Text("Score: \(score)")
                        .foregroundColor(self.phoneTheme == .dark ? Color.white : Color.black)
                        .fontWeight(.bold)
                    Spacer(minLength: 0.5)
                    Text("Tap the flag of")
                        .foregroundColor(self.phoneTheme == .dark ? Color.white : Color.black)
                    Text(self.countries[self.correctAnswer])
                        .foregroundColor(self.phoneTheme == .dark ? Color.white : Color.black)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Spacer()
                }
                Spacer()
                ForEach(0..<3) { flag in
                    Button(action: {
                        self.checkAnswer(flag: flag)
                    }) {
                        Image(self.countries[flag])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                    }.alert(isPresented: $showingScore, content: {
                        Alert(title: Text(self.scoreAlertTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                            self.askNewFlag()
                        })
                    })
                }
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
    
    func checkAnswer(flag answer: Int) {
        if answer == self.correctAnswer {
            self.scoreAlertTitle = "Dope!"
            self.score += 1
        } else {
            self.scoreAlertTitle = "Nope, that was \(self.countries[answer])!"
        }
        self.showingScore = true
    }
    
    func askNewFlag() {
        self.countries.shuffle()
        self.correctAnswer = Int.random(in: 0...2)
        self.showingScore = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
