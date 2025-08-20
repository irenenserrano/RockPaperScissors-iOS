//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Irene Serrano on 8/10/25.
//

import SwiftUI

struct ContentView: View {
    @State var playersSelectedMove: MoveOptionModel
    @State private var showPlayerVsComputerView = false
    @StateObject var counters = CounterVariables()
    
    var body: some View {
        NavigationView {
            ZStack{
                Image(.weatheredPaperBackground)
                
                VStack{
                    Text("Choose your move!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    ForEach(MoveOptionModel.allCases) { move in
                        if playersSelectedMove == move {
                            MoveOptionIcon(moveImage: move.iconImage, moveTitle: move.iconTitle)
                                .shadow(color: .black, radius: 20)
                        } else {
                            MoveOptionIcon(moveImage: move.iconImage, moveTitle: move.iconTitle)
                                .onTapGesture {
                                    playersSelectedMove = move
                                }
                        }
                        
                    }

                    
                    NavigationLink(destination: PlayerVSComputerView(playersChoice: $playersSelectedMove).navigationBarHidden(true), isActive: $showPlayerVsComputerView) {
                        EmptyView()
                    }
                    .environmentObject(counters)
                    
                    Button("Select") {
                        print("Ties: \(counters.ties), Wins: \(counters.wins), Losses: \(counters.losses)")
                        showPlayerVsComputerView.toggle()
                        
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(15)
                    .background(.black)
                    
                }// VStack End
                
            }// ZStack End
            
        }// End of NavigationView
        
    }// End of body
}

#Preview {
    @Previewable @State var move: MoveOptionModel = .rock
    @Previewable @StateObject var counts = CounterVariables()
    ContentView(playersSelectedMove: move, counters: counts)
        .environmentObject(counts)
}


