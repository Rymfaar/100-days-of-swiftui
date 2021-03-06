//
//  ContentView.swift
//  WeSplit
//
//  Created by Alexis Beaudoin on 08/02/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var amountOfPeople = ""
    @State private var tipIndex = 0

    let tipPourcentages = [5, 10, 15, 20, 0]
    var totalBill: Double {
        // Calculate the total amount to pay (including tip)
        let orderAmount = Double(amount) ?? 0
        let tipPourcentageChosen = Double(tipPourcentages[tipIndex])
        
        let tipAmount = orderAmount / 100 * tipPourcentageChosen
        
        return orderAmount + tipAmount
    }
    var totalPerPerson: Double {
        // Calculate the total amount to pay per person (including tip)
        let totalPeople = Double(amountOfPeople) ?? 1
        
        print(totalBill)

        return totalBill / totalPeople
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount to pay", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Amount of people", text: $amountOfPeople)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip pourcentage", selection: $tipIndex) {
                        ForEach(0..<tipPourcentages.count) {
                            Text("\(self.tipPourcentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Total amount")) {
                    Text("\(totalBill, specifier: "%.2f")€")
                }
                
                Section(header: Text("Total amount per person")) {
                    Text("\(totalPerPerson, specifier: "%.2f")€ per person")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
