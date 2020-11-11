//
//  OrderRow.swift
//  FruitMart
//
//  Created by 이경준 on 2020/11/11.
//

import SwiftUI

struct OrderRow: View {
    let order: Order
    
    var body: some View {
        HStack {
            ResizedImage(order.product.imageName)
                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
                .padding()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(order.product.name).font(.headline).fontWeight(.medium)
                
                Text("￦\(order.price) | \(order.quantity)개")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .frame(height: 100)
    }
}

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        List(productSamples.indices) { index in
          OrderRow(order:
            Order(id: index,
                  product: productSamples[index],
                  quantity: (1...9).randomElement()!))
        }
    }
}
