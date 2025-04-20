//
//  WishlistAppApp.swift
//  WishlistApp
//
//  Created by MacBookPro-Taamalli on 4/20/25.
//

import SwiftUI
import SwiftData

@main
struct WishlistAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for : Wish.self)
        }
    }
}
