//
//  ListItem.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 09/04/21.
//

import SwiftUI

struct ListItem: View {
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image("")
                .frame(width: 85, height: 90, alignment: .leading)
                .background(Color(red: 100, green: 100, blue: 100,opacity: 1))
                .cornerRadius(12.0)
            // Album Art Image

            
            VStack(alignment: .leading, spacing: 16){
                Text("Song Name is here")
                    .font(.title2)
                    .lineLimit(1)
                // Title

                HStack(alignment: .center, spacing: 16) {
                        Text("Singer Name, Singer Name2")
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .lineLimit(1)

                        Text("3 min 42 sec")
                            .font(.caption)
                            .multilineTextAlignment(.trailing)
                            .lineLimit(1)
                }// Singerr & Duration HStack
            
            } // VStack
            .frame(width: .infinity, height: .infinity, alignment: .center)
            
            Image("")
                .frame(width: 55, height: 60, alignment: .center)
                .background(Color(red: 100, green: 100, blue: 100,opacity: 1))
                .cornerRadius(12.0)
            // Download Action Image
            
            
        } // HStack
        .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: 100, alignment: .leading)
        .padding(12)
    }// Body
}

struct ListItem_Previews: PreviewProvider {
    static var previews: some View {
        ListItem()
            .previewLayout(.sizeThatFits)
    }
}
