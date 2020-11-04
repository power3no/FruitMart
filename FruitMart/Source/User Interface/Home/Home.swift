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
        NavigationView{
            List(store.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductRow(product: product)
                }
            }
            
            
            .navigationTitle("과일마트")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home(store: Store())
    }
}
