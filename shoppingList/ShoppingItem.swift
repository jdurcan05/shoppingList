//
//  ShoppingItem.swift
//  shoppingList
//
//  Created by JAMES DURCAN on 11/1/22.
//

import Foundation
import UIKit

class ShoppingItem: Codable {
    
    var title: String
    enum area: String, Codable {
        case deli = "Deli", produce = "Produce", grains = "Grains", freezer = "Freezer"
    }
    var place: ShoppingItem.area
    var bought: Bool
    
    init(title: String, place: ShoppingItem.area) {
        self.title = title
        self.place = place
        self.bought = false
    }
    
}
