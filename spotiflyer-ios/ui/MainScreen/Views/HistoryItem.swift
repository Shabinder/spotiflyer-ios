//
//  HistoryItem.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 24/04/21.
//

import SwiftUI

struct HistoryItem: View {
    
    var imagePath: String
    var title: String
    var type: String
    var trackCount: Int
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 8){
            Image("logo")
                .resizable()
                .frame(width: 55, height: 55, alignment: .center)
                .padding(.leading)
            VStack(alignment: .leading, spacing: 8){
                Text(title)
                    .font(.title2)
                    .lineLimit(1)
                // Title

                HStack(alignment: .center, spacing: 16) {
                        Text(type)
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                        Spacer()
                        Text("Tracks: \(trackCount)")
                            .font(.caption)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(1)
                }// Name & Track Count HStack
            } // VStack
            .padding(.horizontal)
            Image("open-image")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .padding(.trailing)
            // Download Action Image
        }// HStack
    }
}

struct HistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        HistoryItem(
            imagePath: "logo",
            title: "Playlist Name",
            type: "Playlist",
            trackCount: 100,
            action: {}
        )
        .previewDevice("iPhone 12")
        .previewLayout(.sizeThatFits)
    }
}
