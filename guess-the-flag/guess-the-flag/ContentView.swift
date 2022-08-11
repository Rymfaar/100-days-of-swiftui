//
//  ContentView.swift
//  guess-the-flag
//
//  Created by ippon on 18/07/2022.
//

import SwiftUI

enum Country: String, CaseIterable {
    case estonia
    case france
    case germany
    case ireland
    case italy
    case nigeria
    case poland
    case russia
    case spain
    case uk
    case us
}

extension Country {
    static var allCountries: [Country] = [.estonia, .france, .germany, .ireland, .nigeria, .poland, .russia, .spain, .uk, .us]
}

struct ContentView: View {
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    @State private var countries: [Country] = Country.allCountries.shuffled()
    @State private var correctAnswerIndex: Int = Int.random(in: Constants.correctAnswerRange)
    @State private var score: Int = 0
    
    var questionTitles: some View {
        VStack {
            Text("Tap the flag of")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            Text(countries[correctAnswerIndex].rawValue)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        ZStack {
            LinearGradientView()
            VStack {
                Text("Score: \(score)")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer()
                VStack (spacing: 15) {
                    questionTitles
                    ForEach(Constants.nbButtonsRange, id: \.self) { index in
                        FlagButton(country: countries[index], onTap: { checkAnswer(index) })
                            .alert(scoreTitle, isPresented: $showingScore) {
                                Button("Continue", action: askNextQuestion)
                            } message: {
                                Text("Score: \(score)")
                            }
                    }
                }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .padding(16)
                Spacer()
            }
        }
    }

    func checkAnswer(_ flagIndex: Int) {
        if flagIndex == correctAnswerIndex {
            scoreTitle = "CORRECT ANSWER"
            score += 1
        } else {
            scoreTitle = "INCORRECT ANSWER"
        }
        showingScore.toggle()
    }
    
    func askNextQuestion() {
        countries.shuffle()
        correctAnswerIndex = Int.random(in: Constants.correctAnswerRange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
