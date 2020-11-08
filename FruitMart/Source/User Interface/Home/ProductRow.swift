//
//  ProductRow.swift
//  FruitMart
//
//  Created by Jun on 2020/10/31.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var store: Store
    let product: Product
    @Binding var quickOrder: Product?
    @State private var willAppear: Bool = false
    
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
        .opacity(willAppear ? 1 : 0)
        .animation(.easeInOut(duration: 0.4))
        .onAppear { self.willAppear = true }
    }
}

private extension ProductRow {
    
    var productImage: some View {
        ResizedImage(product.imageName)
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
                + Text("\(product.price)").font(.headline)
            
            Spacer()
            
            FavoriteButton(product: product)
            Symbol("cart", color: Color.peach)
                .frame(width: 32, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    self.orderProduct()
                }
        }
    }
    func orderProduct() {
        quickOrder = product
        store.placeOrder(product: product, quantity: 1)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
//        ProductRow(product: productSamples[0])
        Group {
            ForEach(productSamples) {
                ProductRow(product: $0, quickOrder: .constant(nil))
            }
            ProductRow(product: productSamples[0], quickOrder: .constant(nil))
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
