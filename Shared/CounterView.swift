//
//  CounterView.swift
//  Counter
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI

public class Counter: ObservableObject {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) public var count = 0
    private var initialCount: Int = 0

    public init(initialCount: Int = 0) {
        self.initialCount = initialCount
        self.count = initialCount
    }

    public func increment(by x: Int = 1) {
        count += x
    }

    public func decrement(by x: Int = 1) {
        count -= x
    }

    public func reset() {
        count = initialCount
    }
    
}

public struct IncrementButton: View {
    @EnvironmentObject private var counter: Counter

    public init() { }

    public var body: some View {
        Button {
            counter.increment()
        } label: {
            Image(systemName: "plus")
        }
    }
}

public struct DecrementButton: View {
    @EnvironmentObject private var counter: Counter

    public init() { }

    public var body: some View {
        Button {
            counter.decrement()
        } label: {
            Image(systemName: "minus")
        }
    }
}

public struct ResetButton: View {
    @EnvironmentObject private var counter: Counter
    @State private var showResetConfirmation: Bool = false

    public init() { }

    public var body: some View {
        Button {
            showResetConfirmation.toggle()
        } label: {
            Label("Reset", systemImage: "gobackward")
        }
        .alert(isPresented: $showResetConfirmation) {
            Alert(title: Text("Reset Count?"),
                  message: Text("This will set the count to zero."),
                  primaryButton: Alert.Button.default(Text("Reset Counter"), action: { counter.reset() }),
                  secondaryButton: Alert.Button.cancel())
        }
    }
}

struct CounterView: View {
    @EnvironmentObject private var counter: Counter
    @ScaledMetric(relativeTo: Font.TextStyle.headline) var headlineSize: CGFloat = 20
    @ScaledMetric(relativeTo: Font.TextStyle.largeTitle) var largeTitleSize: CGFloat = 64

    var body: some View {
        VStack {
            Text("COUNT")
                .font(Font.system(size: headlineSize, weight: .semibold, design: .rounded))
                .foregroundColor(.secondary)

            Text(counter.count, format: .number)
                .font(Font.system(size: largeTitleSize, weight: .heavy, design: .rounded))
                .foregroundColor(.primary)
        }
        .padding()
        .frame(minWidth: 320, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                DecrementButton()
                IncrementButton()
            }
            ToolbarItem(placement: .destructiveAction) {
                ResetButton()
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
        .environmentObject(Counter())
        .previewLayout(.fixed(width: 300, height: 200))
    }
}
