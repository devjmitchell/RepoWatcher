//
//  ContributorMediumView.swift
//  RepoWatcherWidgetExtension
//
//  Created by Jason Mitchell on 4/2/24.
//

import SwiftUI
import WidgetKit

struct ContributorMediumView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Top Contributors")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.secondary)
                Spacer()
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2),
                      alignment: .leading,
                      spacing: 20) {
                ForEach(0..<4) { i in
                    HStack {
                        Image(.avatar)
                            .resizable()
                            .frame(width: 44, height: 44)
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading) {
                            Text("Jason Mitchell")
                                .font(.caption)
                                .minimumScaleFactor(0.7)
                            Text("42")
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContributorMediumView()
}
