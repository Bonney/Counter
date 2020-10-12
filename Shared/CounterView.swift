//
//  CounterView.swift
//  Counter
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI

struct CounterView: View {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) var count = 0
    @State private var showResetConfirmation: Bool = false

    @ScaledMetric(relativeTo: Font.TextStyle.headline) var headlineSize: CGFloat = 20
    @ScaledMetric(relativeTo: Font.TextStyle.largeTitle) var largeTitleSize: CGFloat = 64

    var body: some View {
        VStack {
            Text("COUNT")
                .font(Font.system(size: headlineSize, weight: .semibold, design: .rounded))
                .foregroundColor(.secondary)

            Text("\(count)")
                .font(Font.system(size: largeTitleSize, weight: .heavy, design: .rounded))
                .foregroundColor(.primary)
        }
        .padding()
        .frame(minWidth: 320, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                minusButton
                plusButton
            }

            ToolbarItem(placement: .destructiveAction) {
                resetButton
            }
        }
    }

    var minusButton: some View {
        Button(action: { count -= 1 }) {
            Image(systemName: "minus")
        }
    }

    var plusButton: some View {
        Button(action: { count += 1 }) {
            Image(systemName: "plus")
        }
    }

    var resetButton: some View {
        Button(action: { showResetConfirmation.toggle() }) {
            Label("Reset", systemImage: "gobackward")
        }
        .alert(isPresented: $showResetConfirmation) {
            Alert(title: Text("Reset Count?"),
                  message: Text("This will set the count to zero."),
                  primaryButton: Alert.Button.default(Text("Reset to Zero"), action: { count = 0 }),
                  secondaryButton: Alert.Button.cancel())
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView().previewLayout(.fixed(width: 300, height: 200))
    }
}
