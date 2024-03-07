//
//  CriminalInformation.swift
//  TheBatApp
//
//  Created by Salman Mhaskar on 07/03/24.
//

import SwiftUI

struct CriminalInformation: View {
    var streetName: String
    var name: String
    var age: String
    var description: String
    var skills: String
    var crime: String
    var caught: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .black.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 20 ){
                HStack{
                    
                    Text(streetName)
                        .ThemeTitle()
                    
                    Text(caught ? "-ARRESTED" : "- NOT ARRESTED")
                        .font(.custom("Changa-Regular", size: 22))
                        .foregroundStyle(caught ? .green : .red)
                        .offset(y: 19)
                    
                }
                .padding(.horizontal)
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 10 ){
                        Text("NAME")
                            .InfoHead()
                        Text(name)
                            .InfoBody()
                        
                        Text("AGE")
                            .InfoHead()
                        Text(age)
                            .InfoBody()
                        
                        Text("DESCRIPTION")
                            .InfoHead()
                        Text(description)
                            .InfoBody()
                        
                        Text("SKILLS / ATTRIBUTES")
                            .InfoHead()
                        Text(skills)
                            .InfoBody()
                        
                        Text("CRIME")
                            .InfoHead()
                        Text(crime)
                            .InfoBody()
                        
                    }
                    
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    CriminalInformation(streetName: "SPIDY", name: "Salman", age: "21", description: "6ft Awesome Guy", skills: "Math Uptop", crime: "not Placed", caught: false)
}
