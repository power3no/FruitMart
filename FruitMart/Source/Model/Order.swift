//
//  Order.swift
//  FruitMart
//
//  Created by 이경준 on 2020/11/05.
//

import Foundation

struct Order: Identifiable {
    static var orderSequence = sequence(first: 1) { $0 + 1 }
    
    let id: Int
    let product: Product
    let quantity: Int
    
    var price: Int {
        product.price * quantity
    }
    
}
