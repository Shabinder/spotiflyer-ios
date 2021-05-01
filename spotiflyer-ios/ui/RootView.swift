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
            .previewDevice("iPhone 12")
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
