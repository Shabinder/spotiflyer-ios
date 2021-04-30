//
//  HistoryColumn.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import SwiftUI
import SpotiFlyer

struct HistoryColumn: View {

    let list: [DownloadRecord]
    let loadImage: (_ url: String, _ completionHandler: @escaping (Picture?, Error?) -> Void) -> Void
    let onItemClicked: (String) -> Void

    var body: some View {
        List(self.list) { item in
            HistoryItem (
                    loadImage: loadImage,
                    title: item.name,
                    type: item.type,
                    coverUrl: item.coverUrl,
                    trackCount: Int(item.totalFiles),
                    action: { onItemClicked(item.link) }
            )
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical,8)
                    .onTapGesture{ withAnimation { self.onItemClicked(item.link) } }
        }
    }
}

extension DownloadRecord: Identifiable {}

struct HistoryColumn_Previews: PreviewProvider {
    static var previews: some View {
        let item = DownloadRecord(id: 0,type: "Playlist",name: "Track Name",link: "",coverUrl: "",totalFiles: 100)
        HistoryColumn(
                list: Array(repeating: item, count: 5),
                loadImage: { s, result in },
                onItemClicked: { s in }
        )
    }
}
