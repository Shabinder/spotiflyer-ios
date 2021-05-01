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

    @State var coverImage: UIImage = UIImage.init(named: "placeholder")!

    var body: some View {
        let model = models.value
        let data = model.queryResult

        ZStack {
            if let result = data {
                VStack(alignment: .center,spacing: 12) {
                    Image(uiImage: coverImage)
                            .frame(width: 190, height: 210, alignment: .center)
                            .cornerRadius(12.0)
                            .padding()
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

                    List(result.trackList) { item in
                        ListItem(item: item, loadImage: component.loadImage)
                    }
                    // TrackList
                }
            } else {
                LoadingAnim()
            }
        }
    }
}
extension TrackDetails: Identifiable {}
struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen(StubSpotiFlyerList())
            .previewDevice("iPhone 12")
    }

    class StubSpotiFlyerList: SpotiFlyerList {

        var models: Value<SpotiFlyerListState> =
                valueOf(
                        SpotiFlyerListState(
                                queryResult: nil,
                                link: "",
                                trackList: Array(repeating: TrackDetails(title: "Song Name", artists: ["Shabinder","Shobit"], durationSec: 265, albumName: "", year: "", comment: "", lyrics: "", trackUrl: "", albumArtPath: "", albumArtURL: "", source: .spotify, progress: 0, downloaded: .NotDownloaded(), outputFilePath: "", videoID: ""), count: 5),
                                errorOccurred: nil
                        )
                )

        func loadImage(url: String, completionHandler: @escaping (Picture?, Error?) -> Void) {}

        func onBackPressed() {}

        func onDownloadAllClicked(trackList: [TrackDetails]) {}

        func onDownloadClicked(track: TrackDetails) {}

        func onRefreshTracksStatuses() {}
    }
}
