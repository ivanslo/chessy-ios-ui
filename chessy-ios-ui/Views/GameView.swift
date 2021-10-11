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
            ZStack {
                Board(dark: Color.gray, light: Color.white)
                PiecesView(pieces: game.piecesInBoard, orientation: boardOrientation)
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .rotationEffect(Angle.degrees((self.boardOrientation == .fromWhiteToBlack) ? 0 : 180))

            VStack {
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
                }
                Button(action: {
                           withAnimation {
                               if self.boardOrientation == .fromBlackToWhite {
                                   self.boardOrientation = .fromWhiteToBlack
                               } else {
                                   self.boardOrientation = .fromBlackToWhite
                               }
                           }
                       },
                       label: {
                           Image(systemName: "crop.rotate")
                       })
            }
        }
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
