//
//  GameInfoRow.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 15/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

struct GameInfoRow: View {
    var gameInfo: GameInfo

    var body: some View {
        HStack{
            Text(gameInfo.white)
            Text("vs").bold()
            Text(gameInfo.black)
        }
    }
}

struct GameInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameInfoRow(gameInfo: gameInfoList[0])
            GameInfoRow(gameInfo: gameInfoList[1])
        }
        .previewLayout(.fixed(width: 300, height: 70 ))
    }
}
