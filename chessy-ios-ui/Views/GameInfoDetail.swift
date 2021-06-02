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

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing).rotationEffect(Angle.init(degrees: 90)))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

struct GameInfoDetail: View {
    var gameDetail: GameDetail

    func playNext() -> Void {
        self.idx = (self.idx + 1).clamped(0, gameDetail.jsonFileParsed.steps.count-1)
    }
    func playBefore () -> Void {
        self.idx = (self.idx - 1).clamped(0, gameDetail.jsonFileParsed.steps.count-1)
    }

    @State private var idx: Int = 0
    var body: some View {
        VStack{
            ZStack{
                Board()
                Pieces(arrangementStr: gameDetail.jsonFileParsed.steps[idx].board)
            }.aspectRatio(1, contentMode: .fit)

            HStack{
                Button(action: playBefore , label: {
                    Image(systemName: "chevron.left.circle")
                })
                    .buttonStyle(GradientButtonStyle())
                Button(action: playNext , label: {
                    Image(systemName: "chevron.right.circle")
                })
                    .buttonStyle(GradientButtonStyle())
            }
            Text(gameDetail.jsonFileParsed.steps[idx].board)
                .font(.caption)
        }

    }
}

struct GameInfoDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameInfoDetail(gameDetail: gameDetail)
    }
}
