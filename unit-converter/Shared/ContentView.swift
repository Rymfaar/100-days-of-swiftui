//
//  ContentView.swift
//  Shared
//
//  Created by ippon on 13/07/2022.
//

import SwiftUI

enum Units {
    case meter
    case foot
    case mile
}

struct ContentView: View {
    let units: [Units] = [.meter, .foot, .mile]
    
    @State var inputUnit: Units = .meter
    @State var outputUnit: Units = .foot
    @State var inputValue = ""

    var outputValue: Double {
        let valueToConvert = Double(inputValue) ?? 0.0
        
        switch inputUnit {
        case .meter where outputUnit == .mile:
            return valueToConvert.meterToMile()
        case .meter where outputUnit == .foot:
            return valueToConvert.meterToFoot()
        case .mile where outputUnit == .meter:
            return valueToConvert.mileToMeter()
        case .mile where outputUnit == .foot:
            return valueToConvert.mileToFoot()
        case .foot where outputUnit == .meter:
            return valueToConvert.footToMeter()
        case .foot where outputUnit == .mile:
            return valueToConvert.footToMile()
        default:
            return valueToConvert
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input & output unit")) {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.rawValue)
                        }
                    }.pickerStyle(.segmented)
                    Picker("Input unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.rawValue)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section(header: Text("Input")) {
                    TextField("\(inputUnit) value to convert", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Output")) {
                    Text("\(outputValue) \(outputUnit)(s)")
                }
            }
            .navigationTitle("Unit converter")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
