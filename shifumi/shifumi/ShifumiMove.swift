//
//  ShifumiMoves.swift
//  shifumi
//
//  Created by ippon on 31/08/2022.
//

import Foundation

enum ShifumiMove: String, CaseIterable {
    case rock = "👊"
    case paper = "✋"
    case scissors = "✌️"
    
    static var allMoves: [ShifumiMove] = [.rock, .paper, .scissors]
    
    static func newMove() -> ShifumiMove {
        if let move = ShifumiMove.allCases.randomElement() {
            return move
        }
        return ShifumiMove.rock
    }
}
