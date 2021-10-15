//
//  ContentView.swift
//  WordScramble
//
//  Created by Alexis Beaudoin on 12/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State var wifiEnabled = false
    
    private let networks = ["We have an Hulk", "IONIS", "Livebox-2a88", "SFR-1a43", "SFR-0909", "Xiaomi phone", "Galaxy S21 de Maximilien"]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle("Wi-FI", isOn: $wifiEnabled)
                }
                
                if wifiEnabled {
                    Section(header: Text("Networks")) {
                        ForEach (networks, id: \.self) { network in
                            HStack{
                                Text(network)
                                Spacer()
                                HStack {
                                    Image(systemName: "lock.fill")
                                    Image(systemName: "wifi")
                                    Image(systemName: "info.circle").foregroundColor(.blue)
                                }
                            }
                        }
                        Text("Other...")
                    }
                    
                    Section {
                        HStack {
                            Text("Ask to join Networks")
                            Spacer()
                            HStack {
                                Text("Ask")
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    
                    Section {
                        HStack {
                            Text("Auto-join Hotspot")
                            Spacer()
                            HStack {
                                Text("Ask to Join")
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Wi-Fi").font(.headline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(wifiEnabled: true)
    }
}
