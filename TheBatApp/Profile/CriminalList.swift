//
//  CriminalList.swift
//  TheBatApp
//
//  Created by Salman Mhaskar on 07/03/24.
//

import SwiftUI

struct CriminalList: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var addCriminal = false
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(vm.savedEntity){ entity in
                        NavigationLink(destination: CriminalInformation(streetName: entity.streetName ?? "None",
                                                                        name: entity.criminalName ?? "",
                                                                        age: entity.criminalAge ?? "",
                                                                        description: entity.criminalDescription ?? "",
                                                                        skills: entity.criminalSkills ?? "",
                                                                        crime: entity.crime ?? "",
                                                                        caught: entity.caught)) 
                        {
                            Text(entity.criminalName ?? "")
                        }
                    }
                }
            }
            .overlay(alignment: .bottomTrailing){
                Button(action: {
                    addCriminal = true
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 55, height: 55)
                        .foregroundStyle(.cyan)
                        .padding()
                })
            }
            .sheet(isPresented: $addCriminal, content: {
                AddCriminal()
            })
            .onAppear{
                vm.fetchCriminals()
            }
        }
        .navigationTitle("Criminals")
    }
}

#Preview {
    CriminalList()
}
