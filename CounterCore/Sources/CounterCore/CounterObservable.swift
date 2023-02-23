//
//  Counter.swift
//  
//
//  Created by Matt Bonney on 2/22/23.
//

import SwiftUI
import WidgetKit

public class Counter: ObservableObject {
    @AppStorage("count", store: UserDefaults(suiteName: "group.io.bonney.counter")) public var count = 0

    public init() {
    }

    public func increment(by x: Int = 1) {
        count += x
        countDidChange()
    }

    public func decrement(by x: Int = 1) {
        count -= x
        countDidChange()
    }

    public func reset() {
        count = 0
        countDidChange()
    }

    public func set(to x: Int) {
        count = x
        countDidChange()
    }

    private func countDidChange() {
        WidgetCenter.shared.reloadAllTimelines()
        print("Reloading WidgetCenter timelines")
    }
}
