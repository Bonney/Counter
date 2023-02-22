//
//  CounterApp.swift
//  Shared
//
//  Created by Matt Bonney on 6/23/20.
//

import SwiftUI
import CounterCore

@main
struct CounterApp: App {
    @StateObject private var counter = Counter(initialCount: 0)

    var body: some Scene {
        WindowGroup {
            CounterView()
                .environmentObject(counter)
        }
//        .commands {
//            CommandMenu("Count") {
//
//                Button(action: { count -= 1 }) {
//                    Text("Decrement Count by 1")
//                }
//                .keyboardShortcut("-", modifiers: .command)
//
//                Button(action: { count += 1 }) {
//                    Text("Increment Count by 1")
//                }
//                .keyboardShortcut("+", modifiers: .command)
//            }
//        }
    }
}
