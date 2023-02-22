//
//  File.swift
//  
//
//  Created by Matt Bonney on 2/22/23.
//

import SwiftUI
import CounterCore

public struct ResetButton: View {
    @EnvironmentObject private var counter: Counter
    @State private var showResetConfirmation: Bool = false

    public init() { }

    public var body: some View {
        Button(role: .destructive) {
            showResetConfirmation.toggle()
        } label: {
            Label("Reset", systemImage: "gobackward")
                .font(.system(.title, design: .rounded, weight: .bold))
                .frame(minHeight: 38)
                .frame(maxWidth: .infinity)
        }
        .controlSize(.large)
        .buttonStyle(.bordered)
        .tint(.red)
        .alert(isPresented: $showResetConfirmation) {
            Alert(title: Text("Reset Count?"),
                  message: Text("This will set the count to zero."),
                  primaryButton: Alert.Button.default(Text("Reset Counter"), action: { counter.reset() }),
                  secondaryButton: Alert.Button.cancel())
        }
    }

//    @EnvironmentObject private var counter: Counter
//    public let value: Int
//
//    public init(value: Int = 1) {
//        self.value = value
//    }
//
//    public var body: some View {
//        Button {
//            counter.decrement(by: value)
//        } label: {
//            label()
//                .font(.system(.title, design: .rounded, weight: .bold))
//                .frame(minHeight: 38)
//                .frame(maxWidth: .infinity)
//        }
//        .controlSize(.large)
//        .buttonStyle(.borderedProminent)
//    }
//

}

struct ResetButton_Previews: PreviewProvider {
    static var previews: some View {
        ResetButton()
            .environmentObject(Counter())
    }
}

