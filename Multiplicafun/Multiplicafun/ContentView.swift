//
//  ContentView.swift
//  Multiplicafun
//
//  Created by Alexis Beaudoin on 11/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var practiceTable: Int = 2
    @State private var questionIndex: Int = 0
    @State private var questionNumber: Array<Int> = [5, 10, 20]
    @State private var currentQuestion: Int = 0
    
    var body: some View {
        VStack {
            Stepper("Revise table of \(self.practiceTable)", value: $practiceTable, in: 2...12)
                .onChange(of: self.practiceTable) { _ in
                    self.currentQuestion = 0
                }
                .padding(.horizontal, 16)
            Picker("Number of questions", selection: $questionIndex) {
                ForEach (0 ..< self.questionNumber.count) { number in
                    Text("\(self.questionNumber[number]) questions")
                }
            }
            .onChange(of: self.questionIndex) { _ in
                self.currentQuestion = 0
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 16)
            Spacer()
            Text("Question \(self.currentQuestion) / \(self.questionNumber[self.questionIndex])")
            Text("\(Int.random(in: 1...12)) x \(practiceTable)")
            Spacer()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
