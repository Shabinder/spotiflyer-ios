//
//  LoadingAnim.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 01/05/21.
//

import SwiftUI

struct LoadingAnim: View {
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
                .multilineTextAlignment(.center)
                .scaleEffect(x: 2, y: 2, anchor: .center)
                //.padding(.bottom)
            //Text("Fetching\nResult")
                //.multilineTextAlignment(.center)
                //.foregroundColor(Color("LightGrayColor"))
                //.font(.title2)
        }
    }
}

struct LoadingAnim_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnim()
            .previewDevice("iPhone 12")
    }
}
