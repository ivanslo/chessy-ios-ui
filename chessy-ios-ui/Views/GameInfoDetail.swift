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
        ZStack{
            Board()
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
                Text(gameDetail.jsonFileParsed.steps[0].board)
                Text(gameDetail.jsonFileParsed.steps[1].board)
                Text(gameDetail.jsonFileParsed.steps[2].board)
           }.navigationBarTitle(gameDetail.Event)
        }

    }
}

struct GameInfoDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoDetail(gameDetail: gameDetail)
    }
}
