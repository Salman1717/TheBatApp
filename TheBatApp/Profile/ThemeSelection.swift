//
//  ThemeSelection.swift
//  TheBatApp
//
//  Created by Salman Mhaskar on 07/03/24.
//

import SwiftUI

struct ThemeSelection: View {
    
    @State private var currentIndex = 0
    
    let actors = [
            (name: "Christian Bale", image: "chrisBat", stats: [
                "Strength": 85,
                "Agility": 85,
                "Speed": 80,
                "IQ": 90
            ], color: Color.orange),
            (name: "Ben Affleck", image: "benbat", stats: [
                "Strength": 90,
                "Agility": 80,
                "Speed": 75,
                "IQ": 90
            ], color: Color.blue),
            (name: "Robert Pattinson", image: "robertBat", stats: [
                "Strength": 85,
                "Agility": 90,
                "Speed": 85,
                "IQ": 95
            ], color: Color.red)
        ]
    
    var body: some View {
        ZStack{
            
            VStack(spacing:20){
                HStack {
                    Image(systemName: "chevron.backward.circle.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 30, height: 30)
                    Spacer()
                    Text(actors[currentIndex].name)
                        .ThemeTitle()
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                
                Spacer()
                
                VStack(alignment: .leading) {
                    ForEach(actors[currentIndex].stats.keys.sorted(), id: \.self) { key in
                        Text("\(key): \(actors[currentIndex].stats[key]!)")
                            .textBody()
                    }
                }
                
                Text("SELECT")
                    .foregroundStyle(actors[currentIndex].color)
                    .buttonText()
                    .padding(.horizontal)
                    .background{
                        RoundedRectangle(cornerRadius: 20, style: .circular)
                            .foregroundStyle(.regularMaterial)
                    }
                
            }
            
        }
        .background(Image(actors[currentIndex].image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea())
        .gesture(
            DragGesture(minimumDistance: 0)
                .onEnded{ value in
                    if value.translation.width < 1{
                        withAnimation(.easeIn(duration: 1.1)) {
                            currentIndex = (currentIndex - 1 + actors.count) % actors.count
                        }
                    }else if value.translation.width > 1{
                        withAnimation(.easeOut(duration: 1.1)) {
                            currentIndex = (currentIndex + 1 + actors.count) % actors.count
                        }
                    }
                    
                }
            
        )
    }
}



#Preview {
    ThemeSelection()
}
