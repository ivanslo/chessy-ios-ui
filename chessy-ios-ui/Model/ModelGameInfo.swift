//
//  ModelGameInfo.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 14/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import Foundation

let LIST_URL = "https://lncbz6li8i.execute-api.eu-west-2.amazonaws.com/prod/getlist"

// TODO: get rid of these once I clean-up the UI
var gameInfoList: [GameInfo] = load("gameList.json")
var gameDetail: GameDetail = load("gameDetail.json")


/*
 * load<T> opens a local JSON file and decodes it as T.
 */

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)

    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
