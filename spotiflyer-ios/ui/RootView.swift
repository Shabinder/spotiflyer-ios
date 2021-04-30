//
//  RootView.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 30/04/21.
//

import SwiftUI
import SpotiFlyer

struct RootView: View {
    
    @ObservedObject
    private var routerStates: ObservableValue<RouterState<AnyObject, SpotiFlyerRootChild>>
    private var callBacks: SpotiFlyerRootCallBacks
    
    init(_ component: SpotiFlyerRoot) {
        self.routerStates = ObservableValue(component.routerState)
        self.callBacks = component.callBacks
    }

    private func spotiFlyerRoot(componentContext: ComponentContext)->SpotiFlyerRoot {
        return SpotiFlyerRootKt.SpotiFlyerRoot(componentContext: componentContext, dependencies: RootDependencies())
    }

    private class RootDependencies: SpotiFlyerRootDependencies {

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

        var dispatcherIO: Kotlinx_coroutines_coreCoroutineDispatcher = Kotlinx_coroutines_coreCoroutineDispatcher()

        var isInternetAvailable: Bool = true // TODO

        var platformActions: PlatformActions = IOSActions()
    }

    private class IOSActions:PlatformActions {}

    var body: some View {
        
        let child = self.routerStates.value.activeChild.instance
        
        switch child {
        case let main as SpotiFlyerRootChild.Main:
            MainScreen(main.component)

        case let list as SpotiFlyerRootChild.List:
            ListScreen(list.component)
                .transition(
                    .asymmetric(
                        insertion: AnyTransition.move(edge: .trailing),
                        removal: AnyTransition.move(edge: .trailing)
                    )
                )
                .animation(.easeInOut)
            
        default: EmptyView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(StubSpotiFlyerRoot())
    }

    class StubSpotiFlyerRoot: SpotiFlyerRoot {
        var callBacks: SpotiFlyerRootCallBacks = stubCallBacks()

        var routerState: Value<RouterState<AnyObject, SpotiFlyerRootChild>> =
            simpleRouterState(SpotiFlyerRootChild.Main(component: MainScreen_Previews.StubSpotiFlyerMain()))

    }

    class stubCallBacks: SpotiFlyerRootCallBacks {
        func popBackToHomeScreen() {}
        func searchLink(link: String) {}
        func setDownloadDirectory() {}
    }
}
