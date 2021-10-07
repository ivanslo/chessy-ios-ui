//
//  Utilities.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 01/10/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import Foundation
import SwiftUI

struct Utilities {
    static func getPiecePositionInBoard(file: Int, rank: Int, boardSize: CGSize, pieceSideSize: CGFloat, boardOrientation: GameOrientation) -> CGPoint {
        let pieceSizeOffset: CGFloat = pieceSideSize / 2

        let realRank = boardOrientation == .fromBlackToWhite ? rank : (7-rank)
        let realFile = boardOrientation == .fromBlackToWhite ? (7-file) : file


        let squareCorner = (boardSize.width / 8) * CGFloat(realFile)
        let extra_offset = ((boardSize.width / 8) - pieceSideSize) / 2
        let x = squareCorner + pieceSizeOffset + extra_offset

        let squareCornerY = (boardSize.height / 8) * CGFloat(realRank)
        let extra_offsetY = ((boardSize.height / 8) - pieceSideSize) / 2
        let y = squareCornerY + pieceSizeOffset + extra_offsetY

        return CGPoint(x: x, y: y)
    }

    static func fileFromPos(_ pos: String) -> Int {
        switch pos.first {
        case "a":
            return 0
        case "b":
            return 1
        case "c":
            return 2
        case "d":
            return 3
        case "e":
            return 4
        case "f":
            return 5
        case "g":
            return 6
        case "h":
            return 7
        case .none:
            return 0
        case .some:
            return 0
        }
    }

    static func rankFromPos(_ pos: String) -> Int {
        switch pos.last {
        case "1":
            return 0
        case "2":
            return 1
        case "3":
            return 2
        case "4":
            return 3
        case "5":
            return 4
        case "6":
            return 5
        case "7":
            return 6
        case "8":
            return 7
        case .none:
            return 0
        case .some:
            return 0
        }
    }
}


func logInView(_ log: String) -> EmptyView {
    print("[log in view] \(log)")
    return EmptyView()
}
