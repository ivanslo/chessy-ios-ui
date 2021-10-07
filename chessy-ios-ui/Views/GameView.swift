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

    var body: some View {
        VStack {
            Text(game.gameEvent).font(.system(size: 10))
            ZStack {
                Board(dark: Color.gray, light: Color.white)
                PiecesView(pieces: game.piecesInBoard, boardOrientation: game.orientation)
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()

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
                   self.game.switchSide()
                   },
                   label: {
                       Image(systemName: "crop.rotate")
                    }
                )
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
