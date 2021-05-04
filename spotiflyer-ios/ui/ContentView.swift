//
//  ContentView.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 01/04/21.
//

import SwiftUI
import SpotiFlyer
import ID3TagEditor

struct ContentView: View {
    
    @State private var componentHolder =
        ComponentHolder {
            SpotiFlyerRootKt.SpotiFlyerRoot (
                componentContext: $0, dependencies: RootDependencies()
            )
        }
    
    class RootDependencies: SpotiFlyerRootDependencies {

        var database: Database? = AppDelegate.deps.database

        var actions: Actions = SpotiFlyerActions()

        var directories: Dir = AppDelegate.deps.dir

        var downloadProgressReport: Kotlinx_coroutines_coreMutableSharedFlow = AppDelegate.deps.sharedFlow

        var fetchPlatformQueryResult: FetchPlatformQueryResult = AppDelegate.deps.fetchPlatformQueryResult

        var storeFactory: MvikotlinStoreFactory = LoggingStoreFactory(delegate: DefaultStoreFactory())
    }

    private class SpotiFlyerActions: Actions {

        func giveDonation() {}

        func openPlatform(packageID: String, platformLink: String) {
            // TODO
        }

        func queryActiveTracks() {
            // TODO
        }

        func setDownloadDirectoryAction() {
            // TODO
        }
        
        func writeMp3Tags(trackDetails: TrackDetails) {
            do {
                let id3TagEditor = ID3TagEditor()
                let id3Tag = ID32v3TagBuilder()
                    .title(frame: ID3FrameWithStringContent(content: trackDetails.title))
                    .album(frame: ID3FrameWithStringContent(content: trackDetails.albumName ?? ""))
                    .albumArtist(frame: ID3FrameWithStringContent(content: trackDetails.artists.joined(separator: ", ")))
                    .artist(frame: ID3FrameWithStringContent(content: trackDetails.artists.joined(separator: ", ")))
                    .publisher(frame: ID3FrameWithStringContent(content: "Publisher V3"))
                    .subtitle(frame: ID3FrameWithStringContent(content: "Subtitle V3"))
                    .originalFilename(frame: ID3FrameWithStringContent(content: trackDetails.title + ".mp3"))
                    .attachedPicture(pictureType: .frontCover, frame: ID3FrameAttachedPicture(picture: try NSData(contentsOfFile: trackDetails.albumArtPath) as Data, type: .frontCover, format: .jpeg))
                    .build()
                
                try id3TagEditor.write(tag: id3Tag, to: trackDetails.outputFilePath)
            } catch {
                print(error)
            }
        }
        
        func shareApp() {
            // TODO
        }

        func showPopUpMessage(string: String, long long_: Bool) {
            // TODO
        }
        
        var isInternetAvailable: Bool {
            return true
        } // TODO

        var platformActions: PlatformActions = IOSActions()
    }

    private class IOSActions:PlatformActions {}

    var body: some View {
        RootView(componentHolder.component)
            .onAppear {
                LifecycleRegistryExtKt.resume(self.componentHolder.lifecycle)
            }
            .onDisappear {
                LifecycleRegistryExtKt.stop(self.componentHolder.lifecycle)
            }
    }// Body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
