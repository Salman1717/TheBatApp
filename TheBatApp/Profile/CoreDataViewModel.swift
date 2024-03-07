//
//  CoreDataViewModel.swift
//  TheBatApp
//
//  Created by Salman Mhaskar on 07/03/24.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject{
    @Published var savedEntity : [CriminalEntity] = []
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "CriminalContainer")
        container.loadPersistentStores{ (description , error ) in
            if let error = error{
                print("Error Loading CoreData \(error)")
            }else{
                print("Success")
            }
        }
    }
    
    func fetchCriminals (){
        let  request = NSFetchRequest<CriminalEntity>(entityName: "CriminalEntity")
        do{
            savedEntity = try container.viewContext.fetch(request)
        }catch let error{
            print("Error Fetching Criminals \(error)")
        }
    }
    
    func addCriminal(streetName: String,
                     criminalName: String,
                     criminalAge: String,
                     criminalDescription: String,
                     crime: String,
                     criminalSkills: String,
                     caught: Bool){
        
        let newCriminal = CriminalEntity(context: container.viewContext)
        newCriminal.streetName = streetName
        newCriminal.criminalName = criminalName
        newCriminal.criminalAge = criminalAge
        newCriminal.criminalDescription = criminalDescription
        newCriminal.criminalSkills = criminalSkills
        newCriminal.crime = crime
        newCriminal.caught = caught
        saveData()
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchCriminals()
        }catch let error{
            print("Error Saving Data \(error)")
        }
    }
}
