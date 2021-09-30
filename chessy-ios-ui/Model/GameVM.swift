//
//  GameVM.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 30/09/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import Foundation

class GameVM: ObservableObject {
    @Published private var game: GameModel

//    private static func createDemoGame() -> GameModel {
//        let gameData: GameData = load("gameDetailNew.json")
//        return GameModel(fromData: gameData)
//    }

    var piecesInBoard: [PieceInBoard] {
        game.piecesInMovement[game.currentMovement]
    }

    init(withGameData data: GameData) {
        game = GameModel(fromData: data)
    }

    var gameId: String { game.blackPlayer }

    // MARK: Intents

    public func advance() {
        let limit = game.piecesInMovement.count - 1
        game.currentMovement = (game.currentMovement + 1).clamped(0, limit)
    }

    public func retrocede() {
        let limit = game.piecesInMovement.count - 1
        game.currentMovement = (game.currentMovement - 1).clamped(0, limit)
    }
}