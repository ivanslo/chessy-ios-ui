//
//  GameDetail.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 22/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import Foundation


struct GameStep: Hashable, Codable {
    var board: String
}
struct GameContent: Hashable, Codable {
    var id: String
    var steps: [GameStep]
}

struct GameDetail: Hashable, Codable, Identifiable {
    var id: String
    var Black: String
    var White: String
    var Event: String
    var Result: String
    var addedDate: String

    var BlackElo: String?
    var Round: String?
    var Site: String?
    var WhiteElo: String?
    var ECO: String?
    var Date: String?

    private var jsonFile: String
    // TO-DO: Clean this up
    var jsonFileParsed: GameContent {
        let decoder = JSONDecoder()
        let data = jsonFile.data(using: .utf8)
        return try! decoder.decode(GameContent.self, from: data!)
    }
}

