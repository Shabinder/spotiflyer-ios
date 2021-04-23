//
//  ActionButton.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import SwiftUI

struct ActionButton: View {
    
    var image: Image
    var title: String
    var subtitle: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {}, label: {
            HStack(alignment: .center, spacing: 8) {
                image
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.horizontal,12)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                    
                    Text(subtitle)
                        .font(.subheadline)
                }// VStack
            }// HStack
            .expandHorizontally()
        })//Button
    }
    
    
    init(
        sysImage:String,
        title: String,
        subtitle: String,
        action: @escaping () -> Void
    ) {
        image = Image(systemName: sysImage)
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }
    
    init(
        logoName: String,
        title: String,
        subtitle: String,
        action: @escaping () -> Void
    ) {
        image = Image(logoName)
        self.title = title
        self.subtitle = subtitle
        self.action = action
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(sysImage: "flag.badge.ellipsis", title: "Github", subtitle: "Star / Fork the project on Github") {
            // Action
        }
        .previewLayout(.sizeThatFits)
    }
}
