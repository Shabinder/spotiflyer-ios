//
//  MainScreen.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                SearchBar()
                    .padding()
                    .padding(.top)
                // SearchBar
                
                TabView {
                    AboutColumn()
                        .tabItem {
                            Image(systemName: "info.circle")
                            Text("About")
                        }.tag(0)
                    
                    HistoryColumn()
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
        MainScreen()
            .previewDevice("iPhone 12")
    }
}

