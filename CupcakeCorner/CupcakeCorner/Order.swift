//
//  Order.swift
//  CupcakeCorner
//
//  Created by Alex Nguyen on 2023-06-26.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Chocolate", "Strawberry", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    @Published var name = ""
    @Published var streetName = ""
    @Published var city = ""
    @Published var postalCode = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetName.isEmpty || city.isEmpty || postalCode.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50 per cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
