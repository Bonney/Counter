//
//  CountUpButton.swift
//  Counter
//
//  Created by Matt Bonney on 10/12/20.
//

import SwiftUI

/// A Button view which always increments the Count by a given amount
struct CountUpButton: View {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) var count = 0
    var x: Int
    var showLabel: Bool

    init(by: Int = 1, label: Bool = false) {
        x = by
        showLabel = label
    }

    var body: some View {
        Button(action: { count += x }) {
            if showLabel {
                Label("\(x)", systemImage: "plus")
            } else {
                Image(systemName: "plus")
            }
        }
    }
}

struct CountUpButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountUpButton()
            CountUpButton(by: 1, label: true)
            CountUpButton(by: 2, label: true)

        }
    }
}
