//
//  Item.swift
//  Quoti
//
//  Created by Juan Hernandez on 30/05/26.
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
