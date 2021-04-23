//
//  HistoryColumn.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import SwiftUI

struct HistoryColumn: View {
    var body: some View {
        List {
            ForEach(0..<6) { _ in
                HistoryItem(imagePath: "logo", title: "Playlist Name", type: "Playlist", trackCount: 100, action: {})
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical,8)
            }
         }
    }
}

struct HistoryColumn_Previews: PreviewProvider {
    static var previews: some View {
        HistoryColumn()
    }
}
