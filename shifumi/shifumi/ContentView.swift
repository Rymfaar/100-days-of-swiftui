//
//  ContentView.swift
//  shifumi
//
//  Created by ippon on 24/08/2022.
//

import SwiftUI

struct ColorizeGoal: ViewModifier {
    var goal: Bool
    
    func body(content: Content) -> some View {
        content.foregroundColor(goal ? .green : .red)
    }
}

extension View {
    func colorizeGoal(basedOn goal: Bool) -> some View {
        self.modifier(ColorizeGoal(goal: goal))
    }
}

struct ContentView: View {
    @State var currentMove: ShifumiMove = ShifumiMove.newMove()
    @State var shouldWin: Bool = Bool.random()
    @State var score: Int = 0
    @State var question: Int = 0
    @State var showResults: Bool = false
    
    let moves: [ShifumiMove] = ShifumiMove.allMoves
    
    var objective: some View {
        HStack(spacing: 0) {
            Text("You should ")
                .fontWeight(.bold)
            Text(shouldWin ? "beat" : "get beaten by")
                .fontWeight(.bold)
                .colorizeGoal(basedOn: shouldWin)
        }
    }
    
    var buttonRow: some View {
        HStack (spacing: 8) {
            ForEach(moves, id: \.self) { move in
                Button {
                    onButtonTap(move)
                } label: {
                    ZStack {
                        Capsule()
                            .fill(.black)
                            .frame(height: 100)
                        Text(move.rawValue).font(.system(size: 50))
                    }
                }
                .alert("GG!", isPresented: $showResults) {
                    Button("Continue", action: newSet)
                } message: {
                    Text("Final score: \(score)/10")
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Question: \(question)/10").fontWeight(.bold)
            Text("Score: \(score)").fontWeight(.bold)
            Spacer()
            objective
            Spacer()
            Text(currentMove.rawValue)
                .font(.system(size: 150))
            Spacer()
            buttonRow
            Spacer()
        }
        .padding(.horizontal, 16)
        .onAppear(perform: generateNewMove)
    }

    func onButtonTap(_ move: ShifumiMove) {
        assertAnswer(move)
        checkEndOfGame()
    }
    
    func assertAnswer(_ answer: ShifumiMove) {
        if shouldWin {
            switch (answer, self.currentMove) {
            case (ShifumiMove.rock, ShifumiMove.scissors):
                self.score += 1
            case (ShifumiMove.scissors, ShifumiMove.paper):
                self.score += 1
            case (ShifumiMove.paper, ShifumiMove.rock):
                self.score += 1
            default:
                break
            }
        } else {
            switch (answer, self.currentMove) {
            case (ShifumiMove.scissors, ShifumiMove.rock):
                self.score += 1
            case (ShifumiMove.rock, ShifumiMove.paper):
                self.score += 1
            case (ShifumiMove.paper, ShifumiMove.scissors):
                self.score += 1
            default:
                break
            }
        }
    }
    
    func newSet() {
        self.question = 1
        self.score = 0
    }
    
    func checkEndOfGame() {
        if self.question >= 10 {
            self.showResults.toggle()
        } else {
            generateNewMove()
        }
    }
    
    func generateNewMove() {
        self.currentMove = ShifumiMove.newMove()
        self.shouldWin.toggle()
        print(self.question)
        self.question += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
