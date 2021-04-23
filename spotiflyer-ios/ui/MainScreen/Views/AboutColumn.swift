//
//  AboutColumn.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import SwiftUI

struct AboutColumn: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:18) {
                GroupBox(
                    label: Text("Supported Platforms")
                        .foregroundColor(Color("AccentColor"))
                ) {
                    HStack(alignment: .center, spacing: 16) {
                        
                        LogoButton(logoName: "spotify-logo",onClick: {})
                        
                        LogoButton(logoName: "gaana-logo",onClick: {})
                        
                        LogoButton(logoName: "youtube-logo",onClick: {})
                        
                        LogoButton(logoName: "youtube-music-logo",onClick: {})
                    }// HStack
                }// Platforms GroupBox
                .padding(.horizontal)
                
                GroupBox(label: Text("Support Development").foregroundColor(Color("AccentColor")), content: {
                    
                    ActionButton(
                        logoName:"github-logo",
                        title: "Github",
                        subtitle: "Star / Fork the project on Github.",
                        action: {}
                    )
                    
                    ActionButton(
                        sysImage:"flag.badge.ellipsis",
                        title: "Translate",
                        subtitle: "Help us translate this app in your native language.",
                        action: {}
                    )
                    
                    ActionButton(
                        sysImage:"giftcard",
                        title: "Donate",
                        subtitle: "If you think I deserve to get paid for my work, consider donating.",
                        action: {}
                    )
                    
                    ActionButton(
                        sysImage:"paperplane.circle.fill",
                        title: "Share",
                        subtitle: "Share this app with your friends and family.",
                        action: {}
                    )
                    
                })// Support Dev GroupBox
                .padding(.horizontal)
            }// VStack
            .expand()
            .accentColor(Color("OffWhiteColor"))
        }
    }
}

struct AboutColumn_Previews: PreviewProvider {
    static var previews: some View {
        AboutColumn()
    }
}
