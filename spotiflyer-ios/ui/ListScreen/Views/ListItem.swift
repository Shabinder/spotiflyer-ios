//
//  ListItem.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 09/04/21.
//

import SwiftUI
import SpotiFlyer

struct ListItem: View {

    @State var albumArt: UIImage = UIImage(named: "logo")!

    var item: TrackDetails
    let loadImage: (_ url: String, _ completionHandler: @escaping (Picture?, Error?) -> Void) -> Void
    let onDownloadClicked: (_ track: TrackDetails) -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(uiImage: albumArt)
                .resizable()
                .frame(width: 70, height: 70, alignment: .leading)
                .cornerRadius(12.0)
                .onAppear {
                    loadImage(item.albumArtURL) { picture, error in
                        if let pic = picture?.image {
                            albumArt =  pic
                        }
                    }
                }
            // Album Art Image

            
            VStack(alignment: .leading, spacing: 12){
                Text(item.title)
                    .font(.title3)
                    .lineLimit(1)
                // Title

                HStack(alignment: .center, spacing: 16) {
                        Text(item.artists.joined(separator: ", "))
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)
                        Spacer()
                        Text("\(item.durationSec / 60) min, \(item.durationSec % 60) sec")
                            .font(.subheadline)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(1)
                            
                }// Singer & Duration HStack
            
            } // VStack
            .padding(.trailing,8)
            .expandHorizontally()
            
            
            
            switch item.downloaded {
            case _ as DownloadStatus.Downloaded:
                Image("check-image")
                    .resizable()
                    .frame(width: 32, height: 32, alignment: .center)
                    .padding(.trailing,4)
                    
            case _ as DownloadStatus.NotDownloaded:
                Image("download-image")
                    .resizable()
                    .frame(width: 42, height: 42, alignment: .center)
                    .padding(.trailing,4)
                    .onTapGesture {
                        withAnimation {
                            onDownloadClicked(item)
                        }
                    }
                
            case _ as DownloadStatus.Queued:
                ProgressView()
                    .multilineTextAlignment(.center)
                    .padding(.trailing,4)
                    .scaleEffect(x: 2, y: 2, anchor: .center)
                    .padding(.trailing,4)
                
            case _ as DownloadStatus.Converting:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("AccentColor")))
                    .multilineTextAlignment(.center)
                    .padding(.trailing,4)
                    .scaleEffect(x: 2, y: 2, anchor: .center)
                    .padding(.trailing,4)
                
            case let status as DownloadStatus.Downloading:
                ProgressView(value: Float(truncating: NSNumber(value: status.progress)),total: 100.0)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("PrimaryColor")))
                        .multilineTextAlignment(.center)
                        .padding(.trailing,4)
                        .scaleEffect(x: 2, y: 2, anchor: .center)
                
            case _ as DownloadStatus.Failed:
                Image("error-image")
                    .resizable()
                    .frame(width: 42, height: 42, alignment: .center)
                    .padding(.trailing,4)
                
            default:
                EmptyView()
            }
            // Download Action Image
            
            
            
        } // HStack
        .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: 80, maxHeight: 80, alignment: .leading)
        .padding(12)
    }// Body
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem(
            item: TrackDetails(title: "Song Name", artists: ["Shabinder"], durationSec: 265, albumName: "", year: "", comment: "", lyrics: "", trackUrl: "", albumArtPath: "", albumArtURL: "", source: .spotify, progress: 0, downloaded: DownloadStatus.NotDownloaded(), outputFilePath: "", videoID: "")
        ) { s, closure in  } onDownloadClicked: {_ in }
                .previewLayout(.sizeThatFits)
    }
}
