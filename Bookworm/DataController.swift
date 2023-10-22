//
//  DataController.swift
//  Bookworm
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error{
                print("Core data failed to load, error: \(error.localizedDescription)")
            }
        }
    }
}
