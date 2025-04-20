//
//  Item.swift
//  Grocery List
//
//  Created by MacBookPro-Taamalli on 4/20/25.
//

import Foundation
import SwiftData

@Model
class Item {
    var title: String
    var isCompleted: Bool = false
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
}
