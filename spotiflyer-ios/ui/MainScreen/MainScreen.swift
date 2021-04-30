//
//  MainScreen.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import SwiftUI
import SpotiFlyer

struct MainScreen: View {

    private let component: SpotiFlyerMain

    @ObservedObject
    private var models: ObservableValue<SpotiFlyerMainState>

    init(_ component: SpotiFlyerMain) {
        self.component = component
        self.models = ObservableValue(component.models)
    }

    var body: some View {
        let model = models.value

        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                SearchBar(
                        link: model.link,
                        updateLink: component.onInputLinkChanged,
                        onSearch: component.onLinkSearch
                ).padding().padding(.top)
                // SearchBar

                TabView {
                    AboutColumn()
                        .tabItem {
                            Image(systemName: "info.circle")
                            Text("About")
                        }.tag(0)
                    
                    HistoryColumn(
                            list: model.records.sorted { $0.id > $1.id },
                            loadImage: component.loadImage,
                            onItemClicked:component.onLinkSearch
                    )
                        .tabItem {
                            Image(systemName: "clock.arrow.circlepath")
                            Text("History")
                        }.tag(1)
                }// TabView
                .accentColor(Color("PrimaryColor"))

            }// VStack

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal){
                    HStack(alignment:  .center, spacing: 12) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32, alignment: .center)
                        
                        Text("SpotiFlyer")
                            .font(.title2).bold()
                    } // HStack Nav Bar
                }
            }
            .navigationBarColor(
                backgroundColor: UIColor(.black).withAlphaComponent(0.7), titleColor: .white
            )
        } // NavigationView
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(StubSpotiFlyerMain())
            .previewDevice("iPhone 12")
    }

    class StubSpotiFlyerMain: SpotiFlyerMain {

        let models: Value<SpotiFlyerMainState> =
                valueOf(
                        SpotiFlyerMainState(
                                records: Array(
                                        repeating: DownloadRecord(id: 0,type: "Playlist",name: "Track Name",link: "",coverUrl: "",totalFiles: 100)
                                        , count: 5
                                ),
                                link: "",
                                selectedCategory: .about
                        )
                )

        func loadImage(url: String, completionHandler: @escaping (Picture?, Error?) -> ()) {}

        func onInputLinkChanged(link: String) {}

        func onLinkSearch(link: String) {}

        func selectCategory(category: SpotiFlyerMainHomeCategory) {}
    }
}

