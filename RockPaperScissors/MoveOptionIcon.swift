//
//  MoveOptions.swift
//  RockPaperScissors
//
//  Created by Irene Serrano on 8/10/25.
//

import SwiftUI

struct MoveOptionIcon: View {
    let moveImage: ImageResource
    let moveTitle: String
    
    var body: some View {
        VStack{
            Image(moveImage)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            
            Text(moveTitle)
                .font(.title)
                .italic()
                .foregroundStyle(.black)
                
        }
        .padding(10)
    }
}

#Preview {
    MoveOptionIcon(moveImage: .rock, moveTitle: "Rock")
}
