//
//  AddCriminal.swift
//  TheBatApp
//
//  Created by Salman Mhaskar on 07/03/24.
//

import SwiftUI

struct AddCriminal: View {
    @State private var streetName = ""
    @State private var criminalName = ""
    @State private var criminalAge = ""
    @State private var crime = ""
    @State private var criminalDescription = ""
    @State private var criminalSkills = ""
    @State private var caught = false
    @StateObject var vm = CoreDataViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.black,.black.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(spacing: 30){
                Text("CRIMINAL ENTRY")
                    .ThemeTitle()
                ScrollView(.vertical){
                    VStack(alignment: .leading, spacing: 10){
                        Text("STREET NAME")
                            .Formheader()
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 55)
                            .padding(.horizontal)
                            .foregroundStyle(.gray)
                            .overlay{
                                TextField(" Name", text: $streetName)
                                    .foregroundStyle(.white)
                                    .font(.custom("Changa-Regular", size: 22))
                                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                                
                            }
                        
                        Text("NAME")
                            .Formheader()
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 55)
                            .padding(.horizontal)
                            .foregroundStyle(.gray)
                            .overlay{
                                TextField(" Name", text: $criminalName)
                                    .foregroundStyle(.white)
                                    .font(.custom("Changa-Regular", size: 22))
                                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                                
                            }
                        
                        Text("AGE")
                            .Formheader()
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 55)
                            .padding(.horizontal)
                            .foregroundStyle(.gray)
                            .overlay{
                                TextField("AGE", text: $criminalAge)
                                    .foregroundStyle(.white)
                                    .font(.custom("Changa-Regular", size: 22))
                                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                                    .keyboardType(.numberPad)
                            }
                        
                        
                        Text("CRIME")
                            .Formheader()
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 120)
                            .padding(.horizontal)
                            .foregroundStyle(.gray)
                            .overlay{
                                TextEditor(text: $crime)
                                    .foregroundStyle(.white)
                                    .scrollContentBackground(.hidden)
                                    .font(.custom("Changa-Regular", size: 18))
                                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                                
                            }
                        
                        Text("CRIMINAL DESCRIPTION...")
                            .Formheader()
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 150)
                            .padding(.horizontal)
                            .foregroundStyle(.gray)
                            .overlay{
                                TextEditor(text: $criminalDescription)
                                    .foregroundStyle(.white)
                                    .scrollContentBackground(.hidden)
                                    .font(.custom("Changa-Regular", size: 18))
                                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                                
                            }
                        
                        Text("SPECIAL SKILLS / ABILITIES")
                            .Formheader()
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 100)
                            .padding(.horizontal)
                            .foregroundStyle(.gray)
                            .overlay{
                                TextEditor(text: $criminalSkills)
                                    .foregroundStyle(.white)
                                    .scrollContentBackground(.hidden)
                                    .font(.custom("Changa-Regular", size: 18))
                                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                                
                            }
                        
                        Text("CAUGHT ???")
                            .Formheader()
                        HStack {
                            Spacer()
                            Toggle( "", isOn: $caught)
                                .toggleStyle(CheckboxToggleStyle())
                            Text(caught ? "YES" : "NO")
                                .foregroundStyle(caught ? .green : .red)
                                .font(.custom("Changa-Regular", size: 20))
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    guard !streetName.isEmpty else {return}
                    vm.addCriminal(streetName: streetName,
                                   criminalName: criminalName,
                                   criminalAge: criminalAge,
                                   criminalDescription: criminalDescription,
                                   crime: crime,
                                   criminalSkills: criminalSkills,
                                   caught: caught)
                    streetName = ""
                    criminalName = ""
                    criminalAge = ""
                    criminalDescription = ""
                    crime = ""
                    criminalSkills = ""
                    caught = false
                    dismiss()
                    vm.fetchCriminals()
                    
                }, label: {
                    Text("ADD CRIMINAL")
                        .foregroundStyle(.white)
                        .font(.custom("Changa-Regular", size: 20))
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                })
                
                
            }
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                .foregroundStyle(configuration.isOn ? .green : .red)
                .cornerRadius(5.0)
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                        .foregroundStyle(configuration.isOn ? .green : .red)
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            
            configuration.label
            
        }
    }
}

#Preview {
    AddCriminal()
}
