//
//  Style.swift
//  guess-the-flag
//
//  Created by ippon on 04/08/2022.
//

import SwiftUI

struct LinearGradientView: View {
    var body: some View {
        LinearGradient(colors: [Color.blue, Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
