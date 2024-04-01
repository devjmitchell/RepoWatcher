//
//  RepoWatcherWidget.swift
//  RepoWatcherWidget
//
//  Created by Jason Mitchell on 4/1/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> RepoEntry {
        RepoEntry(date: Date(), repo: Repository.placeholder)
    }

    func getSnapshot(in context: Context, completion: @escaping (RepoEntry) -> ()) {
        let entry = RepoEntry(date: Date(), repo: Repository.placeholder)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [RepoEntry] = []

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct RepoEntry: TimelineEntry {
    let date: Date
    let repo: Repository
}

struct RepoWatcherWidgetEntryView : View {
    var entry: RepoEntry

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Circle()
                        .frame(width: 50, height: 50)
                    
                    Text(entry.repo.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .minimumScaleFactor(0.6)
                        .lineLimit(1)
                }
                .padding(.bottom, 6)
                
                HStack {
                    StatLabel(value: entry.repo.watchers, systemImageName: "star.fill")
                    StatLabel(value: entry.repo.forks, systemImageName: "tuningfork")
                    StatLabel(value: entry.repo.openIssues, systemImageName: "exclamationmark.triangle.fill")
                }
            }
            
            Spacer()
            
            VStack {
                Text("99")
                    .bold()
                    .font(.system(size: 70))
                    .frame(width: 90)
                    .minimumScaleFactor(0.6)
                    .lineLimit(1)
                
                Text("days ago")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

struct RepoWatcherWidget: Widget {
    let kind: String = "RepoWatcherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                RepoWatcherWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                RepoWatcherWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
        .contentMarginsDisabled() // I added to remove extra padding, not in Sean's course (issue from later iOS versions?)
    }
}

#Preview(as: .systemMedium) {
    RepoWatcherWidget()
} timeline: {
    RepoEntry(date: .now, repo: Repository.placeholder)
    RepoEntry(date: .now, repo: Repository.placeholder)
}

private struct StatLabel: View {
    let value: Int
    let systemImageName: String
    
    var body: some View {
        Label {
            Text("\(value)")
                .font(.footnote)
        } icon: {
            Image(systemName: systemImageName)
                .foregroundStyle(.green)
        }
        .fontWeight(.medium)
    }
}
