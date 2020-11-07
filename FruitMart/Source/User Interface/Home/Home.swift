//
//  ContentView.swift
//  FruitMart
//
//  Created by Jun on 2020/10/31.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var store: Store
    @State private var quickOrder: Product?
    var body: some View {
        NavigationView{
            List(store.products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    ProductRow(product: product, quickOrder: self.$quickOrder)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .popupOverContext(item: $quickOrder, content: popupMessage(product:))
            .navigationTitle("과일마트")
        }
    }
    
    func popupMessage(product: Product) -> some View {
        let name = product.name.split(separator: " ").last!
        return VStack {
            Text(name)
                .font(.title).bold().kerning(3)
                .foregroundColor(.peach)
                .padding()
            OrderCompletedMessage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        Preview(source: Home())
                    .environmentObject(Store())
//            .previewDevice(PreviewDevice(rawValue: $0))
//            .previewDisplayName($0)

    }
}
