//
//  Piece.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 12/05/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

struct Piece: View {
    var piece: String

    private var pieceTwoLetters: String {
        switch piece {
        case "n":
            return "BN"
        case "k":
            return "BK"
        case "b":
            return "BB"
        case "p":
            return "BP"
        case "q":
            return "BQ"
        case "r":
            return "BR"
        case "N":
            return "WN"
        case "K":
            return "WK"
        case "B":
            return "WB"
        case "P":
            return "WP"
        case "Q":
            return "WQ"
        case "R":
            return "WR"
        default:
            print("NO MATCHING PIECE FOR \(piece)")
            return "BP"
        }
    }


    // TODO: fix the 'empty image' for something else...
    // there are issues with the types in swift
    var body: some View {
       if piece != "." {
            return Text(pieceTwoLetters)
        } else {

        return Text("\u{2654}")
            .font(.largeTitle)
        }
    }
}

struct Piece_Previews: PreviewProvider {
    static var previews: some View {
        List{
            Group{
                Piece(piece:".")
            }
            Group{
                Piece(piece:"b")
                Piece(piece:"k")
                Piece(piece:"n")
                Piece(piece:"p")
                Piece(piece:"q")
                Piece(piece:"r")
            }
            Group{
                Piece(piece:"B")
                Piece(piece:"K")
                Piece(piece:"N")
                Piece(piece:"P")
                Piece(piece:"Q")
                Piece(piece:"R")
            }
        }
    }
}
