//
//  Pieces.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 12/05/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI
let PIECE_SIZE = CGFloat(34)
let PIECE_OFFSET = CGFloat(PIECE_SIZE/2)

struct Pieces: View {
//    const pieceSize = 20

    var body: some View {
        GeometryReader { geometry in
            Piece(piece: "BR")
                .frame(width:PIECE_SIZE, height: PIECE_SIZE)
                .position(x: 0+PIECE_OFFSET, y: 0+PIECE_OFFSET)
            Piece(piece: "BN")
                .frame(width:PIECE_SIZE, height: PIECE_SIZE)
                .position(x: 100, y: 0)
            Piece(piece: "BB")
                    .frame(width:PIECE_SIZE, height: PIECE_SIZE)
            .position(x: 200, y: 0)
            Piece(piece: "BQ")
                .frame(width:PIECE_SIZE, height: PIECE_SIZE)
                .position(x: 300, y: 0)
        }

    }
}

struct Pieces_Previews: PreviewProvider {
    static var previews: some View {
        Pieces()
    }
}
