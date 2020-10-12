//
//  iOS_Widget.swift
//  iOS Widget
//
//  Created by Matt Bonney on 6/23/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries a minute apart, starting from the current date.
        let currentDate = Date()
        for minuteOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
}

struct PlaceholderView : View {
    var body: some View {
        CountText()
    }
}

struct iOS_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CountText()
    }
}

@main
struct iOS_Widget: Widget {
    private let kind: String = "iOS_Widget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            iOS_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Counter")
        .description("Shows the current count.")
    }
}
