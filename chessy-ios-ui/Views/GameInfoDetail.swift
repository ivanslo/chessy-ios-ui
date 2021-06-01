//
//  GameInfoDetail.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 16/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

extension Comparable {
    func clamped(_ f: Self, _ t: Self) -> Self {
        var r = self
        if r < f { r = f }
        if r > t { r = t }
        return r
    }
}


struct GameInfoDetail: View {
    var gameDetail: GameDetail

    func playNext(_ nr : Int) -> Int {
        return (nr + 1).clamped(0, gameDetail.jsonFileParsed.steps.count-1)
    }
    func playBefore(_ nr : Int) -> Int {
        return (nr - 1).clamped(0, gameDetail.jsonFileParsed.steps.count-1)
    }

    @State private var idx: Int = 0
    var body: some View {
        
        VStack{
            ZStack{
                Board()
                Pieces(arrangementStr: gameDetail.jsonFileParsed.steps[idx].board)
            }.frame(width: 370, height: 370)

            HStack{
                Button(action:{
                    self.idx = self.playBefore(self.idx)
                }){
                    Text("<")
                }
                .frame(width: 70, height: 50)
                .background(Color.gray)
                Button(action:{
                    self.idx = self.playNext(self.idx)
                }){
                    Text(">")
                }
                .frame(width: 70, height: 50)
                .background(Color.gray)
            }
            Text(gameDetail.jsonFileParsed.steps[idx].board)
        }

    }
}

struct GameInfoDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoDetail(gameDetail: gameDetail)
    }
}
