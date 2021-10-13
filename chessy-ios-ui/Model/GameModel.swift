//
//  GameModel.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 01/10/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import Foundation

struct GameModel {
    let blackPlayer: String
    let whitePlayer: String

    let blackElo: String
    let whiteElo: String

    let event: String
    let date: String

    let piecesInMovement: [[PieceInBoard]]
    let piecesTaken: [[PieceTaken]]

    var currentMovement: Int

    init(fromData data: GameData) {
        blackPlayer = data.Black
        whitePlayer = data.White
        event = data.Event
        date = data.Date ?? "-"
        blackElo = data.BlackElo ?? "?"
        whiteElo = data.WhiteElo ?? "?"

        currentMovement = 0

        var _piecesInMovement: [[PieceInBoard]] = []
        var _piecesTaken: [[PieceTaken]] = []

        var dict: [String: GameData.PieceArrangementDetail] = [:]
        for step in data.jsonFile.steps {
            for key in dict.keys {
                dict[key]!.justMoved = false
            }
            dict["r1"] = step.boardDictDiff.r1 ?? dict["r1"]
            dict["r2"] = step.boardDictDiff.r2 ?? dict["r2"]
            dict["n1"] = step.boardDictDiff.n1 ?? dict["n1"]
            dict["n2"] = step.boardDictDiff.n2 ?? dict["n2"]
            dict["b1"] = step.boardDictDiff.b1 ?? dict["b1"]
            dict["b2"] = step.boardDictDiff.b2 ?? dict["b2"]
            dict["q1"] = step.boardDictDiff.q1 ?? dict["q1"]
            dict["k1"] = step.boardDictDiff.k1 ?? dict["k1"]
            dict["p1"] = step.boardDictDiff.p1 ?? dict["p1"]
            dict["p2"] = step.boardDictDiff.p2 ?? dict["p2"]
            dict["p3"] = step.boardDictDiff.p3 ?? dict["p3"]
            dict["p4"] = step.boardDictDiff.p4 ?? dict["p4"]
            dict["p5"] = step.boardDictDiff.p5 ?? dict["p5"]
            dict["p6"] = step.boardDictDiff.p6 ?? dict["p6"]
            dict["p7"] = step.boardDictDiff.p7 ?? dict["p7"]
            dict["p8"] = step.boardDictDiff.p8 ?? dict["p8"]

            dict["R1"] = step.boardDictDiff.R1 ?? dict["R1"]
            dict["R2"] = step.boardDictDiff.R2 ?? dict["R2"]
            dict["N1"] = step.boardDictDiff.N1 ?? dict["N1"]
            dict["N2"] = step.boardDictDiff.N2 ?? dict["N2"]
            dict["B1"] = step.boardDictDiff.B1 ?? dict["B1"]
            dict["B2"] = step.boardDictDiff.B2 ?? dict["B2"]
            dict["Q1"] = step.boardDictDiff.Q1 ?? dict["Q1"]
            dict["K1"] = step.boardDictDiff.K1 ?? dict["K1"]
            dict["P1"] = step.boardDictDiff.P1 ?? dict["P1"]
            dict["P2"] = step.boardDictDiff.P2 ?? dict["P2"]
            dict["P3"] = step.boardDictDiff.P3 ?? dict["P3"]
            dict["P4"] = step.boardDictDiff.P4 ?? dict["P4"]
            dict["P5"] = step.boardDictDiff.P5 ?? dict["P5"]
            dict["P6"] = step.boardDictDiff.P6 ?? dict["P6"]
            dict["P7"] = step.boardDictDiff.P7 ?? dict["P7"]
            dict["P8"] = step.boardDictDiff.P8 ?? dict["P8"]

            var movement: [PieceInBoard] = []
            var taken: [PieceTaken] = []
            for key in dict.keys {
                if !dict[key]!.taken {
                    let moved = _piecesInMovement.count != 0 && dict[key]!.justMoved != false
                    movement.append(PieceInBoard(id: key,
                                                 face: dict[key]!.face,
                                                 file: Utilities.fileFromPos(dict[key]!.pos),
                                                 rank: Utilities.rankFromPos(dict[key]!.pos),
                                                 justChanged: moved))
                }
                else {
                    let face = dict[key]!.face
                    let color : PieceColor = face.first!.isUppercase ? .white : .black
                    taken.append(PieceTaken(id: key, face: face, color: color ))
                }
            }

            _piecesInMovement.append(movement)
            _piecesTaken.append(taken)
        }

        piecesInMovement = _piecesInMovement
        piecesTaken = _piecesTaken
    }
}

struct PieceTaken: Identifiable, Hashable {
    let id: String
    let face: String
    let color: PieceColor
}

enum PieceColor {
    case white
    case black
}

struct PieceInBoard: Identifiable, Hashable {
//    static func == (lhs: PieceInBoard, rhs: PieceInBoard) -> Bool {
//        return lhs.id == rhs.id
//    }

    let id: String
    let face: String
    let file: Int
    let rank: Int
    let justChanged: Bool
}
