//
//  ContentView.swift
//  Shared
//
//  Created by ippon on 20/06/2022.
//

import SwiftUI

struct Tip: ViewModifier {
    var tipPourcentage: Int

    func body(content: Content) -> some View {
        content.foregroundColor(tipPourcentage == 0 ? .red : .black)
    }
}

extension View {
    func tip(pourcent tipPourcentage: Int) -> some View {
        self.modifier(Tip(tipPourcentage: tipPourcentage))
    }
}

struct ContentView: View {
    @State private var amount = 0.0
    @State private var peopleIndex = 0
    @State private var tipPourcentage = 0
    
    private let tipPourcentages = [10, 15, 20, 25, 0]
    
    var amountWithTip: Double {
        let percentMultiplier = Double(tipPourcentage) / 100
        return amount + (amount * percentMultiplier)
    }
    
    var amountPerPerson: Double {
        let numberOfPeople = Double(peopleIndex + 2)
        return amountWithTip / numberOfPeople;
    }
    
    @FocusState private var keyboardFocused: Bool
    
    var tipSelector: some View {
        Section(header: Text("Want to leave a tip?")) {
            Picker("Leave a tip?", selection: $tipPourcentage) {
                ForEach(tipPourcentages, id: \.self) {
                    Text($0, format: .percent)
                }
            }.pickerStyle(.segmented)
        }
    }
    
    var splitAmountField: some View {
        Section {
            Text(amountWithTip, format: .currency(code: Locale.current.currencyCode ?? "EUR")).tip(pourcent: tipPourcentage)
            Text(amountPerPerson, format: .currency(code: Locale.current.currencyCode ?? "EUR"))
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // Not using [text] as parameter because amount is a double
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "EUR")) // Default currency on phone else use euros
                            .keyboardType(.decimalPad)
                            .focused($keyboardFocused)
                    Picker("Amount of people", selection: $peopleIndex) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                tipSelector
                splitAmountField
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        keyboardFocused.toggle()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
