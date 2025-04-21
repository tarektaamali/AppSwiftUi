//
//  Pet.swift
//  Paws
//
//  Created by MacBookPro-Taamalli on 4/21/25.
//

import Foundation
import SwiftData

@Model
final class Pet {
    var name: String
    @Attribute(.externalStorage) var photo: Data?
    
    init(name: String, photo: Data? = nil   ) {
        self.name = name
        self.photo = photo
    }
}

extension Pet {
    @MainActor
    static var preview: ModelContainer {
       let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container =  try!  ModelContainer(for : Pet.self, configurations: configuration)

        container.mainContext.insert(Pet(name: "Buddy"))
        container.mainContext.insert(Pet(name: "Milo"))
        container.mainContext.insert(Pet(name: "Luna"))
        container.mainContext.insert(Pet(name: "Bella"))
        container.mainContext.insert(Pet(name: "Charlie"))
        container.mainContext.insert(Pet(name: "Max"))
        container.mainContext.insert(Pet(name: "Daisy"))
        container.mainContext.insert(Pet(name: "Rocky"))

        return container
    }
}
