//
//  Board.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 23/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

struct ChessBoard: Shape {
    /*
     ChessBoard Shape draws the squares of the 'dark' pieces.
     To theme the board one should `fill` with one color and `background` with another.
     */
    func path( in rect:CGRect) -> Path {
        var path = Path()

        let w = rect.width / 8
        let h = rect.height / 8

        for i in 0..<8 {
            for j in 0..<8 {
                if (i+j).isMultiple(of: 2){
                    let startX = CGFloat(i) * w
                    let startY = CGFloat(j) * h
                    let rect = CGRect(x:startX, y:startY, width: w, height: h)
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct Board: View {
    var body: some View {
        ChessBoard()
            .fill(Color.red)
            .background(Color.orange)
    }
}

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Board().frame(width:300, height: 300)
    }
}
