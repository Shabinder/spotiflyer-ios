//
//  ContentView.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 01/04/21.
//

import SwiftUI
import SpotiFlyer

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

        var storeFactory: MvikotlinStoreFactory = DefaultStoreFactory()
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

        func shareApp() {
            // TODO
        }

        func showPopUpMessage(string: String, long long_: Bool) {
            // TODO
        }

        var currentPlatform: AllPlatforms = AllPlatforms.Native()

        var dispatcherIO: Kotlinx_coroutines_coreCoroutineDispatcher = AppDelegate.deps.defaultDispatcher

        var isInternetAvailable: Bool = true // TODO

        var platformActions: PlatformActions = IOSActions()
    }

    private class IOSActions:PlatformActions {}


    
    var body: some View {
        RootView(componentHolder.component)
            .onAppear { LifecycleRegistryExtKt.resume(self.componentHolder.lifecycle)
                print(AppDelegate.deps.dir.defaultDir())
            }
            .onDisappear { LifecycleRegistryExtKt.stop(self.componentHolder.lifecycle) }
    }// Body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.sizeThatFits)
    }
}
