//
//  CounterApp.swift
//  Shared
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI

@main
struct CounterApp: App {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) var count = 0

    var body: some Scene {
        WindowGroup {
            CounterView()
        }
        .commands {
            CommandMenu("Count") {

                Button(action: { count -= 1 }) {
                    Text("Decrement Count by 1")
                }
                .keyboardShortcut("-", modifiers: .command)

                Button(action: { count += 1 }) {
                    Text("Increment Count by 1")
                }
                .keyboardShortcut("+", modifiers: .command)
            }
        }
    }
}
