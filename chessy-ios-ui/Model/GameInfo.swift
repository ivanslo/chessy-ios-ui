//
//  GameInfo.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 14/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import Foundation


struct GameInfo: Hashable, Codable {
    var id: String
    var black: String
    var white: String
    var event: String
    var result: String
}
