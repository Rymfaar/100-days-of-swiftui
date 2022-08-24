//
//  ContentView.swift
//  shifumi
//
//  Created by ippon on 24/08/2022.
//

import SwiftUI

enum ShifumiMove: Int, CaseIterable {
    case rock = 0
    case paper = 1
    case scissors = 2
    
    static func newMove() -> ShifumiMove {
        if let move = ShifumiMove.allCases.randomElement() {
            return move
        }
        return ShifumiMove.rock
    }
}

struct ContentView: View {
    @State var shouldWin: Bool = Bool.random()
    @State var currentMove: ShifumiMove = ShifumiMove.newMove()
    
    let moves: [String] = ["👊", "✋", "✌️"]
    
    var body: some View {
        Text(moves[currentMove.rawValue])
            .padding()
    }
    
    func generateNewMove() -> Int {
        return Int.random(in: 0..<3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
