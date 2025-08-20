//
//  RockPaperScissorsApp.swift
//  RockPaperScissors
//
//  Created by Irene Serrano on 8/10/25.
//

import SwiftUI

@main
struct RockPaperScissorsApp: App {
    var body: some Scene {
        WindowGroup {
            @State var move: MoveOptionModel = .rock
            ContentView(playersSelectedMove: move)
                .environmentObject(CounterVariables())
        }
    }
}
