//
//  FileManagement.swift
//  spotiflyer-ios
//
//  Created by Shabinder Singh on 24/04/21.
//

import Foundation

func printPath(){
    var parent = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    parent.appendPathComponent("")
}
