//
//  Piece.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 12/05/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI


let charToPiece : [String:String] = [
    "n":"\u{265E}",
    "k":"\u{265A}",
    "b":"\u{265D}",
    "p":"\u{265F}",
    "q":"\u{265B}",
    "r":"\u{265C}",
    "N":"\u{2658}",
    "K":"\u{2654}",
    "B":"\u{2657}",
    "P":"\u{2659}",
    "Q":"\u{2655}",
    "R":"\u{2656}",
    ".":" "
]

struct Piece: View {
    var piece: String


    var body: some View {
        Text(charToPiece[piece]!)
            .font(.largeTitle)

    }
}

struct Piece_Previews: PreviewProvider {
    static var previews: some View {
        List{
            
            Group{
                Piece(piece:"r")
                Piece(piece:"n")
                Piece(piece:"b")
                Piece(piece:"q")
                Piece(piece:"k")
                Piece(piece:"p")
            }
            Group{
                Piece(piece:"R")
                Piece(piece:"N")
                Piece(piece:"B")
                Piece(piece:"Q")
                Piece(piece:"K")
                Piece(piece:"P")
            }
        }
    }
}
