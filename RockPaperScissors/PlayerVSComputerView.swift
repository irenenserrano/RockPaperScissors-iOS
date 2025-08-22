//
//  PlayerVSComputerView.swift
//  RockPaperScissors
//
//  Created by Irene Serrano on 8/12/25.
//

import SwiftUI

struct PlayerVSComputerView: View {
    @State var randomRawValue = Int.random(in: 0...2)
    @Binding var playersChoice: MoveOptionModel
    @EnvironmentObject var counters: CounterVariables
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView{
            ZStack{
                Image(.weatheredPaperBackground)
                
                VStack{
                    Text("Computer chooses...")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    let computerChoice = MoveOptionModel(rawValue: randomRawValue)!
                    
                    MoveOptionIcon(moveImage: computerChoice.id.iconImage, moveTitle: computerChoice.id.iconTitle)
                    
                    Text("Your choice was...")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    MoveOptionIcon(moveImage: playersChoice.id.iconImage, moveTitle: playersChoice.id.iconTitle)
                    
                    
                    Text("Play again?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 40)
                    
                    HStack{
                         Text("Yes")
                                .font(.title)
                                .italic()
                                .foregroundColor(.white)
                                .padding(10)
                                .background(.black)
                                .onTapGesture{
                                    print("Ties: \(counters.ties), Wins: \(counters.wins), Losses: \(counters.losses)")
                                    dismiss()
                                }
                        
                        NavigationLink(destination: ClosingStatsView().navigationBarHidden(true)) {
                            Text("No")
                                .font(.title)
                                .italic()
                                .foregroundColor(.white)
                                .padding(10)
                                .padding(.horizontal, 5)
                                .background(.black)
                        }
                        
                    }// HStack End
                    .onAppear {
                        self.updateStats()
                        print("Raw Value: \(randomRawValue), Computer Choice: \(computerChoice), Icon Title: \(computerChoice.id.iconTitle), ID: \(computerChoice.id)")
                    }
                }// VStack End
                
            }// ZStack End
        }// NavigationView End
    }// body End
    
    func updateStats() {
        if playersChoice.rawValue == randomRawValue {
            counters.ties += 1
        } else if playersChoice.rawValue == 0 && randomRawValue == 2 || playersChoice.rawValue == 1 && randomRawValue == 0 || playersChoice.rawValue == 2 && randomRawValue == 1 {
            counters.wins += 1
        } else {
            counters.losses += 1
        }
    }
}

#Preview {
    @Previewable @State var choice: MoveOptionModel = .rock
    @Previewable @EnvironmentObject var counts: CounterVariables
    PlayerVSComputerView(playersChoice: $choice, counters: _counts)
        .environmentObject(CounterVariables())
}
