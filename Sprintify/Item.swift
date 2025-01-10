//
//  Item.swift
//  Sprintify
//
//  Created by Akarsh Gharge on 2025-01-10.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
