//
//  CountDownButton.swift
//  Counter
//
//  Created by Matt Bonney on 10/12/20.
//

import SwiftUI

/// A Button view which always decrements the Count by a given amount
struct CountDownButton: View {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) var count = 0
    var x: Int

    init(by: Int = 1) {
        x = by
    }

    var body: some View {
        Button(action: { count -= x }) {
            Label("\(x)", systemImage: "minus")
        }
    }
}

struct CountDownButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountDownButton(by: 1)

            CountDownButton(by: 2)

            CountDownButton()
        }
    }
}
