//
//  NegativeNumberToggle.swift
//  Counter
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI

struct NegativeNumberToggle: View {
    @AppStorage("allowsNegativeNumbers", store: UserDefaults(suiteName: "group.io.bonney.counter")) var allowsNegativeNumbers = false
    
    var body: some View {
        Toggle("Allow Negative Numbers", isOn: $allowsNegativeNumbers)
    }
}

struct NegativeNumberToggle_Previews: PreviewProvider {
    static var previews: some View {
        NegativeNumberToggle()
    }
}
