//
//  ContentView.swift
//  BetterRest
//
//  Created by Alexis Beaudoin on 20/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 0
    @State private var sleepGoal = 8.0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 00
        return Calendar.current.date(from: components) ?? Date()
    }
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 8) {
                    Text("When do you want to wake up ?").font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
                }.padding(.vertical, 4)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Desired sleep goal").font(.headline)
                    Stepper(value: $sleepGoal, in: 1...12, step: 0.25) {
                        Text("\(sleepGoal, specifier: "%g") hours")
                    }
                }.padding(.vertical, 4)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake").font(.headline)
                    Stepper(value: $coffeeAmount, in: 0...20, step: 1) {
                        if coffeeAmount == 0 {
                            Text("0 cup")
                        } else if coffeeAmount == 1 {
                            Text("1 cup")
                        } else {
                            Text("\(coffeeAmount) cups")
                        }
                    }
                }.padding(.vertical, 4)
            }
            .navigationBarTitle("BetterRest")
            .navigationBarItems(trailing:
                Button("Calculate") {
                    self.calculateBedtime()
                }
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(self.alertTitle), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func calculateBedtime() {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepGoal, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            self.alertMessage = formatter.string(from: sleepTime)
            self.alertTitle = "Your ideal bedtime is ..."
        } catch {
            self.alertTitle = "Error"
            self.alertMessage = "Sorry, a problem occured calculating your optimal bedtime"
        }
        self.showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
