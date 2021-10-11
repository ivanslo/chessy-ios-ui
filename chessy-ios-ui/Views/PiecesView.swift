//
//  PiecesView.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 01/10/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

struct PiecesView: View {
    var pieces: [PieceInBoard]
    var orientation: GameOrientation = .fromWhiteToBlack

    var body: some View {
        GeometryReader { geometry in
            ForEach(self.pieces) { piece in
                Piece(piece: piece.face)
                    .rotationEffect(Angle.degrees( (self.orientation == .fromWhiteToBlack) ? 0 : 180))
                    .scaleEffect(piece.justChanged ? 1.3 : 1)
                    .border(Color.green, width: piece.justChanged ? 5 : 0 )
                    .position(Utilities.getPiecePositionInBoard(file: piece.file, rank: piece.rank, boardSize: geometry.size, pieceSideSize: 34))


            }
        }
    }
}












/* Preview
----------------------------------------------------------*/
let piecesInBoard = [
    PieceInBoard(id: "r1", face: "r", file: 4, rank: 5, justChanged: false),
    PieceInBoard(id: "n1", face: "n", file: 0, rank: 0, justChanged: false),
    PieceInBoard(id: "b1", face: "B", file: 3, rank: 1, justChanged: true),
    PieceInBoard(id: "b2", face: "b", file: 2, rank: 5, justChanged: false),
    PieceInBoard(id: "Q1", face: "Q", file: 7, rank: 7, justChanged: false)
]

struct PiecesView_Previews: PreviewProvider {
    static var previews: some View {
        PiecesView(pieces: piecesInBoard)
            .frame(width: 350, height: 350)
            .background(Color.gray)
    }
}
