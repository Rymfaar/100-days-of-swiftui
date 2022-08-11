//
//  FlagButton.swift
//  guess-the-flag
//
//  Created by ippon on 04/08/2022.
//

import SwiftUI

struct FlagButton: View {
    let country: Country
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Image(country.rawValue)
                .renderingMode(.original)
                .clipShape(Capsule())
                .shadow(radius: 5)
        }
    }
}

struct FlagButton_Previews: PreviewProvider {
    static var previews: some View {
        FlagButton()
    }
}
