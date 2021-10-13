//
//  GameModel.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 30/09/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import Foundation


/*
 * GameData matches 1:1 the JSON file returned from the webserver.
 * Its purpose is to put in struct format the content of such file.
 * That explains why it's Hashable and Codable
 */
struct GameData: Codable {
    let id: String
    let Black: String
    let White: String
    let Event: String
    let Result: String
    let addedDate: String
    let BlackElo: String?
    let Round: String?
    let Site: String?
    let WhiteElo: String?
    let ECO: String?
    let Date: String?

    // convenience initializer for locally hosted files
    init(fromFile file: String) {
        self = load(file)
    }

    let jsonFile: GameDetailModel

    struct GameDetailModel: Codable {
        let steps: [GameStepModel]
    }

    struct GameStepModel: Codable {
        let board: String
        let boardDictDiff: PiecesArrangement
    }

    struct PiecesArrangement: Codable {
        // black pieces
        let r1: PieceArrangementDetail?
        let r2: PieceArrangementDetail?
        let n1: PieceArrangementDetail?
        let n2: PieceArrangementDetail?
        let b1: PieceArrangementDetail?
        let b2: PieceArrangementDetail?
        let q1: PieceArrangementDetail?
        let k1: PieceArrangementDetail?
        let p1: PieceArrangementDetail?
        let p2: PieceArrangementDetail?
        let p3: PieceArrangementDetail?
        let p4: PieceArrangementDetail?
        let p5: PieceArrangementDetail?
        let p6: PieceArrangementDetail?
        let p7: PieceArrangementDetail?
        let p8: PieceArrangementDetail?

        // white pieces
        let R1: PieceArrangementDetail?
        let R2: PieceArrangementDetail?
        let N1: PieceArrangementDetail?
        let N2: PieceArrangementDetail?
        let B1: PieceArrangementDetail?
        let B2: PieceArrangementDetail?
        let Q1: PieceArrangementDetail?
        let K1: PieceArrangementDetail?
        let P1: PieceArrangementDetail?
        let P2: PieceArrangementDetail?
        let P3: PieceArrangementDetail?
        let P4: PieceArrangementDetail?
        let P5: PieceArrangementDetail?
        let P6: PieceArrangementDetail?
        let P7: PieceArrangementDetail?
        let P8: PieceArrangementDetail?

    }

    struct PieceArrangementDetail: Codable {
        let pos: String
        let face: String
        let taken: Bool
        var justMoved: Bool?
    }
}
