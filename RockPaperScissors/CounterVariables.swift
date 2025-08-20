//
//  CounterVariables.swift
//  RockPaperScissors
//
//  Created by Irene Serrano on 8/13/25.
//

import Foundation

class CounterVariables: ObservableObject {
    @Published var wins: Int = 0
    @Published var losses: Int = 0
    @Published var ties: Int = 0
}
