//
//  ContentView.swift
//  FruitMart
//
//  Created by Jun on 2020/10/31.
//

import SwiftUI

struct Home: View {
    let store: Store
    
    var body: some View {
        List(store.products, id:\.name) { product in
            ProductRow(product: product)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home(store: Store())
    }
}
