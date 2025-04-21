//
//  PawsApp.swift
//  Paws
//
//  Created by MacBookPro-Taamalli on 4/20/25.
//

import SwiftUI
import SwiftData

@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}
