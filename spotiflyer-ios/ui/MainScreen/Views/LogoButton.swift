//
//  LogoButton.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import SwiftUI

struct LogoButton: View {
    
    var logoName: String
    var onClick: ()->Void
    
    var body: some View {
        Button(action: onClick, label: {
            Image(logoName)
                .resizable()
                .frame(width: 32, height: 32, alignment: .center)
        }) // Button1
    }
}

struct LogoButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoButton(logoName: "spotify-logo",onClick: {})
            .previewLayout(.sizeThatFits)
    }
}
