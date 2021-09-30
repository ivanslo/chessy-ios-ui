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
    var arrangementStr: String = "rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR"

    func getPos(file: Int, rank: Int, size: CGSize) -> CGPoint {
        let squareCorner = (size.width / 8) * CGFloat(file)
        let extra_offset = ((size.width / 8) - PIECE_SIZE) / 2
        let x = squareCorner  + PIECE_OFFSET + extra_offset

        let squareCornerY = (size.height / 8) * CGFloat(rank)
        let extra_offsetY = ((size.height / 8) - PIECE_SIZE) / 2
        let y = squareCornerY  + PIECE_OFFSET + extra_offsetY

        return CGPoint(x: x, y: y)
    }

    private var arrangementArr : [Substring.Element] {
        get {
            var arr : Array<Character> = Array()

            let splitted = arrangementStr.split(separator: Character("/"))
            for line in splitted {
                for  piece in line {
                    if piece.isNumber {
                        let iend = Int(String(piece)) ?? 0
                        for _ in 0..<iend {
                            arr.append(Character("."))
                        }
                    } else {
                        arr.append(piece)
                    }
                }
            }
            return arr
        }
    }

    var body: some View {
        GeometryReader { geometry in
            ForEach( 0..<self.arrangementArr.count, id: \.self ) { nr in
                Piece(piece: String(self.arrangementArr[nr]))
                    .frame(width:PIECE_SIZE, height: PIECE_SIZE)
                    .position(self.getPos(file: Int(nr % 8), rank: nr / 8, size: geometry.size))
            }
        }
        
    }
}

/* Preview
----------------------------------------------------------*/
struct Pieces_Previews: PreviewProvider {
    static var previews: some View {
        Pieces()
        .frame(width: 350, height: 350)
            .background(Color.red)
    }
}
