//
//  SearchBar.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import SwiftUI

struct SearchBar: View {
    
    @State var link = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            
            TextField("Paste Link Here ...", text:$link)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(8)
                .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color("PrimaryColor"), Color("AccentColor")]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
            
            Button(" Search ", action: {})
                .padding(8)
                .font(.title3)
                .foregroundColor(Color("PrimaryColor"))
                .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color("PrimaryColor"), Color("AccentColor")]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2))
                            
        }// VStack
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
            .previewDevice("iPhone 12")
            .frame(width: 480, height: 360, alignment: .center)
            .previewLayout(.sizeThatFits)
    }
}
