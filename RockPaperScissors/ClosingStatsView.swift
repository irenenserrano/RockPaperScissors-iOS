//
//  ClosingStatsView.swift
//  RockPaperScissors
//
//  Created by Irene Serrano on 8/14/25.
//

import SwiftUI

struct ClosingStatsView: View {
    @EnvironmentObject var counters: CounterVariables
    var body: some View {
        ZStack{
            Image(.weatheredPaperBackground)
            
            VStack{
                Text("Closing Stats")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                
                Text("Wins: \(counters.wins)")
                    .italic()
                    .font(.title)
                    .padding(.bottom, 10)
                
                Text("Ties: \(counters.ties)")
                    .italic()
                    .font(.title)
                    .padding(.bottom, 10)
                
                Text("Losses: \(counters.losses)")
                    .italic()
                    .font(.title)
                    .padding(.bottom, 100)
                    
                
                Text("Good Game!")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
//            .border(.black, width: 5)
//            Spacer()
        }
    }
}

#Preview {
    @Previewable @EnvironmentObject var counts: CounterVariables
    ClosingStatsView(counters: _counts)
        .environmentObject(CounterVariables())
}
