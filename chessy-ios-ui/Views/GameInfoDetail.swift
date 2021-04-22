//
//  GameInfoDetail.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 16/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

struct GameInfoDetail: View {
    var gameDetail: GameDetail
    var body: some View {
        VStack{
          Text(gameDetail.White)
          Text("vs").bold()
          Text(gameDetail.Black)
          HStack{
            Text("Result:")
            Text(gameDetail.Result).bold()
         }
            if gameDetail.Date != nil {
                Text(gameDetail.Date!)
            }

            Text(gameDetail.addedDate)
            Text(gameDetail.jsonFile)
       }.navigationBarTitle(gameDetail.Event)
    }
}

struct GameInfoDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoDetail(gameDetail: gameDetail)
    }
}
