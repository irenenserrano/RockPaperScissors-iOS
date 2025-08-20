//
//  MoveIcon.swift
//  RockPaperScissors
//
//  Created by Irene Serrano on 8/10/25.
//

import SwiftUI

enum MoveOptionModel: Int, CaseIterable, Identifiable {
    case rock = 0
    case paper = 1
    case scissors = 2
    
    var id: MoveOptionModel { self }
    
    var iconImage: ImageResource {
        switch self {
        case .rock:
                .rock
        case .paper:
                .paper
        case .scissors:
                .scissors
        }
    }
    
    var iconTitle: String {
        switch self {
        case .rock:
            "Rock"
        case .paper:
            "Paper"
        case .scissors:
            "Scissors"
        }
    }
}
