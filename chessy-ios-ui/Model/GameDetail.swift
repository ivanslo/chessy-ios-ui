//
//  GameDetail.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 22/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import Foundation


struct GameDetail: Hashable, Codable, Identifiable {
    var id: String
    var Black: String
    var White: String
    var Event: String
    var Result: String
    var addedDate: String
    var jsonFile: String
    var BlackElo: String?
    var Round: String?
    var Site: String?
    var WhiteElo: String?
    var ECO: String?
    var Date: String?
}

