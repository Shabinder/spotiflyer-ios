//
//  HistoryItem.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 24/04/21.
//

import SwiftUI
import SpotiFlyer

struct HistoryItem: View {

    let loadImage: (_ url: String, _ completionHandler: @escaping (Picture?, Error?) -> Void) -> Void
    let title: String
    let type: String
    let coverUrl: String
    let trackCount: Int
    let action: () -> Void

    @State var image: UIImage = UIImage.init(named: "placeholder")!

    var body: some View {
        HStack(spacing: 8){
            Image(uiImage: image)
                .resizable()
                .frame(width: 55, height: 55, alignment: .center)
                .padding(.leading)
                .onAppear {
                    loadImage(coverUrl) { picture, error in
                        if let pic = picture?.image {
                            image =  pic
                        }
                    }
                }

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
                    .onTapGesture { withAnimation{ self.action() } }
            // Download Action Image
        }// HStack
    }
}

struct HistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        HistoryItem(
                loadImage: { s, closure in  },
                title: "Playlist Name",
                type: "Playlist",
                coverUrl:"",
                trackCount: 100,
                action: {}
        )
        .previewDevice("iPhone 12")
        .previewLayout(.sizeThatFits)
    }
}
