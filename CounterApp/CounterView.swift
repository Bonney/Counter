//
//  CounterView.swift
//  Counter
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI
import CounterCore
import CounterUI

struct CounterView: View {
    @EnvironmentObject private var counter: Counter

    var currentCount: some View {
        CurrentCount()
            .font(.system(size: 100, weight: .semibold, design: .rounded))
            .monospacedDigit()
            .foregroundColor(.primary)
    }

    var body: some View {
        VStack {
            ResetButton()
            Spacer()
            currentCount
            Spacer()
            HStack {
                DecrementButton()
                IncrementButton()
            }
        }
        .padding()
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
        .environmentObject(Counter())
    }
}
