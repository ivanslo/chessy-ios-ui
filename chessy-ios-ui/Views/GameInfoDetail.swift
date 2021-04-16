//
//  GameInfoDetail.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 16/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

struct GameInfoDetail: View {
    var gameInfo: GameInfo
    var body: some View {
        VStack{
          Text(gameInfo.white)
          Text("vs").bold()
          Text(gameInfo.black)
          HStack{
            Text("Result:")
            Text(gameInfo.result).bold()
         }

       }.navigationBarTitle(gameInfo.event)
    }
}

struct GameInfoDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoDetail(gameInfo: gameInfoList[0])
    }
}
