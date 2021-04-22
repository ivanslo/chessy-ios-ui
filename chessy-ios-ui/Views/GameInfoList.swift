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
        NavigationView{
            List (gameInfoList) { gameInfo in
                NavigationLink(destination: GameInfoDetail(gameDetail: gameDetail)){
                    GameInfoRow(gameInfo: gameInfo)
                }
            }
            .navigationBarTitle("Games")
        }
    }
}

struct GameInfoList_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoList()
    }
}
