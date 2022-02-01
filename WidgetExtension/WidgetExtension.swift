//
//  WidgetExtension.swift
//  WidgetExtension
//
//  Created by Stuti Dobhal on 03.12.20.
//

import WidgetKit
import SwiftUI

@main
struct QuoteWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "WidgetExtension",
            provider: Provider(),
            content: { entry in
                WidgetEntryView(entry: entry)
            }
        )
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
        .configurationDisplayName("Quotes Widget")
        .description("This is a quotes widget.")
    }
}

struct Provider: TimelineProvider {
    let viewModel = QuoteViewModel()

    func placeholder(in context: Context) -> QuoteEntry {
        QuoteEntry(date: Date(), quote: Quote(author: "Placeholder author", content: "Placeholder text"))
    }

    func getSnapshot(in context: Context, completion: @escaping (QuoteEntry) -> Void) {
        let entry = QuoteEntry(date: Date(), quote: Quote(author: "", content: "I have some great inspiring quotes for you. Don't miss them!"))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<QuoteEntry>) -> Void) {

        let components = DateComponents(second: 5)
        let futureDate = Calendar.current.date(byAdding: components, to: Date())!

        viewModel.fetchQuotes { (quote) in
            let entry = QuoteEntry(date: Date(), quote: quote)
            let timeline = Timeline(entries: [entry], policy: .after(futureDate))
            completion(timeline)
        }
    }
}

struct WidgetEntryView: View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            ZStack {
                Image("quotes_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(minHeight: 0, maxHeight: .infinity)
                VStack(alignment: .leading) {
                    Text(entry.quote.content)
                        .italic()
                        .font(.footnote)
                        .foregroundColor(.black)
                        .padding(.bottom, 1.0)
                    Text("\(entry.quote.author)")
                        .italic()
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(40.0)
            }
        case .systemMedium:
            ZStack {
                Image("quotes_bg_h")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(minHeight: 0, maxHeight: .infinity)
                VStack(alignment: .leading) {
                    Text(entry.quote.content)
                        .italic()
                        .font(.body)
                        .foregroundColor(.black)
                        .padding(.bottom, 5.0)
                    Text("\(entry.quote.author)")
                        .italic()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(40.0)
            }

        default:
            ZStack {
                Image("quotes_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(minHeight: 0, maxHeight: .infinity)
                VStack(alignment: .leading) {
                    Text(entry.quote.content)
                        .italic()
                        .font(.title3)
                        .foregroundColor(.black)
                        .padding(.bottom, 5.0)
                    Text("\(entry.quote.author)")
                        .italic()
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(40.0)
            }
        }
    }
}

struct QuoteEntry: TimelineEntry {
    var date: Date
    var quote: Quote
}
