//
//  ListItem.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 09/04/21.
//

import SwiftUI
import SpotiFlyer

struct ListItem: View {

    @State var albumArt: UIImage = UIImage.init(named: "placeholder")!

    var item: TrackDetails
    let loadImage: (_ url: String, _ completionHandler: @escaping (Picture?, Error?) -> Void) -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(uiImage: albumArt)
                .frame(width: 85, height: 90, alignment: .leading)
                .background(Color(red: 100, green: 100, blue: 100,opacity: 1))
                .cornerRadius(12.0)
                .onAppear {
                    loadImage(item.albumArtURL) { picture, error in
                        if let pic = picture?.image {
                            albumArt =  pic
                        }
                    }
                }
            // Album Art Image

            
            VStack(alignment: .leading, spacing: 16){
                Text(item.title)
                    .font(.title2)
                    .lineLimit(1)
                // Title

                HStack(alignment: .center, spacing: 16) {
                        Text(item.artists.joined(separator: ", "))
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)

                        Text("\(item.durationSec / 60) min, \(item.durationSec % 60) sec")
                            .font(.caption)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(1)
                }// Singer & Duration HStack
            
            } // VStack
            .frame(width: .infinity, height: .infinity, alignment: .center)
            
            Image("download-image")
                .frame(width: 55, height: 60, alignment: .center)
                .background(Color(red: 100, green: 100, blue: 100,opacity: 1))
                .cornerRadius(12.0)
            // Download Action Image
            
            
        } // HStack
        .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: 100, alignment: .leading)
        .padding(12)
    }// Body
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(
                item: TrackDetails(title: "Song Name", artists: ["Shabinder","Shobit"], durationSec: 265, albumName: "", year: "", comment: "", lyrics: "", trackUrl: "", albumArtPath: "", albumArtURL: "", source: .spotify, progress: 0, downloaded: .NotDownloaded(), outputFilePath: "", videoID: "")
        ) { s, closure in  }
                .previewLayout(.sizeThatFits)
    }
}
