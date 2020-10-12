//
//  CountText.swift
//  Counter
//
//  Created by Matt Bonney on 10/12/20.
//

import SwiftUI

/// A Text view which always contains the current Count
struct CountText: View {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) var count = 0

    var body: some View {
        Text("\(count)")
    }
}

struct CountText_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountText().font(.largeTitle)
            CountText().font(.headline)
            CountText().font(.body)
        }
    }
}
