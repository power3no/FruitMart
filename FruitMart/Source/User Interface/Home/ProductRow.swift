//
//  ProductRow.swift
//  FruitMart
//
//  Created by Jun on 2020/10/31.
//

import SwiftUI

struct ProductRow: View {
    let product: Product
    
    var body: some View {
        HStack{
            productImage
            productDescription
        }
        .frame(height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color: Color.primaryShadow, radius: 1, x: 2, y: 2)
        .padding(.vertical, 8)
    
    }
}

private extension ProductRow {
    
    var productImage: some View {
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }
    var productDescription: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            Text(product.description)
                .font(.footnote)
                .foregroundColor(.secondaryText)
            Spacer()
            footerView
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
    var footerView: some View {
        HStack() {
            Text("￦").font(.footnote)
                + Text("\(product.price)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            FavoriteButton(product: product)
            Image(systemName: "cart")
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
//        ProductRow(product: productSamples[0])
        Group {
            ForEach(productSamples) {
                ProductRow(product: $0)
            }
            ProductRow(product: productSamples[0])
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
