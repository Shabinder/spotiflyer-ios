//
//  ListScreen.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 01/05/21.
//

import SwiftUI
import SpotiFlyer

struct ListScreen: View {

    private let component: SpotiFlyerList

    @ObservedObject
    private var models: ObservableValue<SpotiFlyerListState>

    init(_ component: SpotiFlyerList) {
        self.component = component
        self.models = ObservableValue(component.models)
    }

    @State var coverImage: UIImage = UIImage.init(named: "logo")!

    var body: some View {
        let model = models.value

        
        if let result = model.queryResult {
            VStack(alignment: .center,spacing: 12) {
                List {
                    ZStack(alignment: .topLeading) {
                        HStack {
                            Spacer()
                            VStack {
                                Image(uiImage: coverImage)
                                    .resizable()
                                    .frame(width: 160, height: 170, alignment: .center)
                                    .cornerRadius(12.0)
                                    .padding(.top,42)
                                    .onAppear {
                                        component.loadImage(url: result.coverUrl) { picture, error in
                                            if let pic = picture?.image {
                                                coverImage =  pic
                                            }
                                        }
                                    }
                                // Cover - Image

                                Text(result.title)
                                        .font(.title2)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                // Name
                            }
                            Spacer()
                        }
                        // Cover-Section
                    
                        Button(action: {
                                withAnimation { component.onBackPressed() } }
                        ) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Close")
                            }
                        }
                        .foregroundColor(Color("AccentColor"))
                        .padding(.top,8)
                        // Close Button
                    }
                    
                    ForEach(result.trackList) { item in
                        ListItem(
                            item: item,
                            loadImage: component.loadImage,
                            onDownloadClicked: component.onDownloadClicked
                        )
                            .listRowInsets(EdgeInsets())
                    }
                    // TrackList
                }
            }
        } else {
            ZStack {
                Button(action: {
                        withAnimation { component.onBackPressed() } }
                ) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Close")
                    }
                }
                .padding()
                .padding(.leading,8)
                .expand()
                
                LoadingAnim()
            }
        }
    }
}

// Mock Data For Preview
let array = Array(repeating: TrackDetails(title: "Song Name", artists: ["Shabinder","Shobit"], durationSec: 265, albumName: "", year: "", comment: "", lyrics: "", trackUrl: "", albumArtPath: "", albumArtURL: "", source: .spotify, progress: 0, downloaded: .NotDownloaded(), outputFilePath: "", videoID: ""), count: 10)

extension TrackDetails: Identifiable {}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        // Initialised List Screen
        ListScreen(StubSpotiFlyerList(isLoading: false))
            .previewDevice("iPhone 12")
        
        // Loading List Screen
        ListScreen(StubSpotiFlyerList(isLoading: true))
            .previewDevice("iPhone 12")
    }
    
    class StubSpotiFlyerList: SpotiFlyerList {
        
        init(isLoading:Bool) {
            models = valueOf(
                    SpotiFlyerListState(
                        queryResult: isLoading ? nil : PlatformQueryResult(folderType: "", subFolder: "", title: "Playlist Name", coverUrl: "logo", trackList: array, source: .spotify),
                            link: "",
                            trackList: array,
                            errorOccurred: nil
                    )
            )
        }
        
        let models: Value<SpotiFlyerListState>

        func loadImage(url: String, completionHandler: @escaping (Picture?, Error?) -> Void) {}

        func onBackPressed() {}

        func onDownloadAllClicked(trackList: [TrackDetails]) {}

        func onDownloadClicked(track: TrackDetails) {}

        func onRefreshTracksStatuses() {}
    }
}
