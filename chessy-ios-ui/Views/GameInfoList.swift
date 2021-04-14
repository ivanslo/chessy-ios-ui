//
//  GameInfoList.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 15/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

struct GameInfoList: View {
    var body: some View {
        List {
            GameInfoRow(gameInfo: gameInfoList[0])
            GameInfoRow(gameInfo: gameInfoList[1])
            GameInfoRow(gameInfo: gameInfoList[2])
            GameInfoRow(gameInfo: gameInfoList[3])
            GameInfoRow(gameInfo: gameInfoList[4])
        }
    }
}

struct GameInfoList_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoList()
    }
}
