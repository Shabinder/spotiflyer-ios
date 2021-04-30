//
//  Extensions.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 23/04/21.
//

import Foundation
import SwiftUI
import SpotiFlyer

public extension View {
    func expand() -> some View {
        frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
    }
    
    func expandVertically() -> some View {
        frame(
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
    }
    
    func expandHorizontally() -> some View {
        frame(
              minWidth: 0,
              maxWidth: .infinity,
              alignment: .topLeading
            )
    }
}
