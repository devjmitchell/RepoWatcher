//
//  ContributorWidget.swift
//  RepoWatcherWidgetExtension
//
//  Created by Jason Mitchell on 4/2/24.
//

import SwiftUI
import WidgetKit

struct ContributorProvider: TimelineProvider {
    func placeholder(in context: Context) -> ContributorEntry {
        ContributorEntry(date: .now)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (ContributorEntry) -> Void) {
        let entry = ContributorEntry(date: .now)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<ContributorEntry>) -> Void) {
        let nextUpdate = Date().addingTimeInterval(43200) // 12 hours in seconds
        let entry = ContributorEntry(date: .now)
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
        completion(timeline)
    }
}

struct ContributorEntry: TimelineEntry {
    var date: Date
}

struct ContributorEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: ContributorEntry
    
    var body: some View {
        Text(entry.date.formatted())
    }
}

struct ContributorWidget: Widget {
    let kind: String = "ContributorWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ContributorProvider()) { entry in
            if #available(iOS 17.0, *) {
                ContributorEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ContributorEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Contributors")
        .description("Keep track of a repository's top contributors.")
        .supportedFamilies([.systemLarge])
        .contentMarginsDisabled() // I added to remove extra padding, not in Sean's course (issue from later iOS versions?)
    }
}

#Preview(as: .systemLarge) {
    ContributorWidget()
} timeline: {
    ContributorEntry(date: .now)
    ContributorEntry(date: .now)
}