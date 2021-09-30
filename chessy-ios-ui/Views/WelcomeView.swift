//
//  WelcomeView.swift
//  chessy-ios-ui
//
//  Created by Slobodiuk, Ivan on 12/04/2021.
//  Copyright © 2021 Slobodiuk, Ivan. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Chessy iOS App")
                .bold()
            Spacer()
            MyButton(text: "Search Games")
            MyButton(text:"Login")
            MyButton(text:"About")
            Spacer()
            GameInfoList()
        }
    }
}

struct MyButton: View {
    var text: String
    var body: some View {
        Button(action:{}){
            Text(text).border(Color.red, width:3)
        }
    }
}


/* Preview
----------------------------------------------------------*/
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
