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
    var body: some View {
        Image(piece)
    }
}

struct Piece_Previews: PreviewProvider {
    static var previews: some View {
        Piece(piece:"BP")
    }
}
