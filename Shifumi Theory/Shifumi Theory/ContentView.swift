//
//  ContentView.swift
//  Shifumi Theory
//
//  Created by Alexis Beaudoin on 11/03/2021.
//

import SwiftUI

enum ShifumiMove: Int {
    case rock = 0
    case paper = 1
    case scissor = 2
}

struct ColorGoal: ViewModifier {
    var goal: Bool
    
    func body(content: Content) -> some View {
        content.foregroundColor(goal ? Color.green : Color.red)
    }
}

extension View {
    func colorizeGoal(based_on goal: Bool) -> some View {
        self.modifier(ColorGoal(goal: goal))
    }
}

struct ContentView: View {
    @Environment(\.colorScheme) private var phoneTheme

    private let moves = ["👊", "✋", "✌️"]
    
    @State var currMove = Int.random(in: 0 ..< 3)
    @State var shouldWin = Bool.random()
    
    @State var question = 0
    @State var score = 0
    
    @State var showSetScore = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 0) {
                    Text("Question: ")
                    Text("\(question)/10")
                        .fontWeight(.bold)
                }
                HStack(spacing: 0) {
                    Text("Score: ")
                    Text("\(score)")
                        .fontWeight(.bold)
                }
                Spacer()
                HStack(spacing: 0) {
                    Text("You should ")
                        .fontWeight(.bold)
                    Text(self.shouldWin ? "win" : "lose")
                        .fontWeight(.bold)
                        .colorizeGoal(based_on: shouldWin)
                    Text(" against:")
                        .fontWeight(.bold)
                }.font(.title)
                Spacer()
                ZStack {
                    Text(self.moves[currMove])
                        .font(.system(size: 150))
                }
                Spacer()
                HStack(spacing: 8) {
                    ForEach(0 ..< moves.count) { move in
                        Button(action: {
                            self.assertAnswer(answer: move, opponent: self.currMove, shouldWin: self.shouldWin)
                            self.nextQuestion()
                        }) {
                            ZStack {
                                Capsule()
                                    .fill(self.phoneTheme == .dark ? Color.white : Color.black)
                                Text(self.moves[move])
                                    .font(.system(size: 45))
                            }
                        }
                    }.alert(isPresented: $showSetScore, content: {
                        Alert(title: Text("GG!"), message: Text("Total score: \(self.score)"), dismissButton: .default(Text("Continue"), action: {
                            self.nextSet()
                        }))
                    })
                }.padding(.horizontal).frame(height: 75, alignment: .center)
                Spacer()
            }
        }
    }
    
    func assertAnswer(answer: Int, opponent: Int, shouldWin: Bool) {
        if shouldWin {
            switch (opponent, answer) {
            case (ShifumiMove.rock.rawValue, ShifumiMove.paper.rawValue):
                self.score += 1
                self.question += 1
            case (ShifumiMove.paper.rawValue, ShifumiMove.scissor.rawValue):
                self.score += 1
                self.question += 1
            case (ShifumiMove.scissor.rawValue, ShifumiMove.rock.rawValue):
                self.score += 1
                self.question += 1
            default:
                self.question += 1
            }
        } else {
            switch (opponent, answer) {
            case (ShifumiMove.rock.rawValue, ShifumiMove.scissor.rawValue):
                self.score += 1
                self.question += 1
            case (ShifumiMove.paper.rawValue, ShifumiMove.rock.rawValue):
                self.score += 1
                self.question += 1
            case (ShifumiMove.scissor.rawValue, ShifumiMove.paper.rawValue):
                self.score += 1
                self.question += 1
            default:
                self.question += 1
            }
        }
    }
    
    func nextQuestion() {
        self.currMove = Int.random(in: 0 ..< 3)
        self.shouldWin = Bool.random()
        if self.question >= 10 {
            self.showSetScore.toggle()
        }
    }

    func nextSet() {
        self.question = 0
        self.score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(shouldWin: true)
    }
}
