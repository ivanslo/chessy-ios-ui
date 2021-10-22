//
//  GameView.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 30/09/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game: GameVM

    @State private var boardOrientation: GameOrientation = .fromWhiteToBlack

    var body: some View {
        VStack {
            Text(game.gameEvent).font(.system(size: 10))
            VStack {
                getPlayerInfo(forSide: .blacks)

                ZStack {
                    Board(dark: Color.gray, light: Color.white)
                    PiecesView(pieces: game.piecesInBoard, orientation: boardOrientation)
                }
                .aspectRatio(1, contentMode: .fit)

                getPlayerInfo(forSide: .whites)
//                HStack {
//                    Spacer()
//                    ForEach(game.piecesTaken.filter { $0.color == .whites }) { piece in
//                        Piece(piece: piece.face)
//                    }
//                }
            }

            .rotationEffect(Angle.degrees((self.boardOrientation == .fromWhiteToBlack) ? 0 : 180))

            Spacer()
            /* Buttons
             ------------------- */
            HStack {
                Button(action: {
                    withAnimation {
                        self.game.retrocede()
                    }

                }, label: {
                    Image(systemName: "chevron.left.circle")
                })
                Button(action: {
                    withAnimation {
                        self.game.advance()
                    }
                }, label: {
                    Image(systemName: "chevron.right.circle")
                })
                Button(action: {
                    withAnimation {
                        if self.boardOrientation == .fromBlackToWhite {
                            self.boardOrientation = .fromWhiteToBlack
                        } else {
                            self.boardOrientation = .fromBlackToWhite
                        }
                    }
                }, label: {
                    Image(systemName: "crop.rotate")
                })
            }
            .font(.system(size: 48))
        }
    }

    func getPlayerInfo(forSide side: PlayerSide) -> some View {
        let name = side == .blacks ? game.blackPlayer : game.whitePlayer
//        let align: HorizontalAlignment = side == .blacks ? .leading : .trailing
        let align = .leading as HorizontalAlignment
        return HStack {

            if align == .trailing {
                Spacer()
            }

            Image(systemName: "flag")
                .font(.system(size: 45))
                .aspectRatio(1, contentMode:.fill )


            VStack(alignment: align) {
                Text(name)
                    .fontWeight(.bold)
                HStack {
                    ForEach(game.piecesTaken.filter { $0.color == side }) { piece in
                        Piece(piece: piece.face)
                    }
                }
            }.environment(\., .)
            if align == .leading {
                Spacer()
            }

        }.environment(\.layoutDirection, .leftToRight)
    }
    
}




/* Preview
 ----------------------------------------------------------*/

let gameVM = GameVM(withGameData: GameData(fromFile: "gameDetailNew.json"))

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: gameVM)
    }
}
