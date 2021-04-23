//
//  HistoryColumn.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import SwiftUI

struct HistoryColumn: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            GroupBox(label: Text("History"), content: {
                    
            })
        }
    }
}

struct HistoryColumn_Previews: PreviewProvider {
    static var previews: some View {
        HistoryColumn()
    }
}
