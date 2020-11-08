//
//  FavoriteProductScrollView.swift
//  FruitMart
//
//  Created by Jun on 2020/11/07.
//

import SwiftUI

struct FavoriteProductScrollView: View {
    @EnvironmentObject private var store: Store
    @Binding var showingImage: Bool
    
    var body: some View {
        VStack {
            title
            if showingImage {
                products
            }
        }
        .padding()
    }
}

private extension FavoriteProductScrollView {
    var title: some View {
        HStack(alignment: .top, spacing: 5) {
            Text("즐겨찾는 상품")
                .font(.headline).fontWeight(.medium)
            Symbol("arrowtriangle.up.square")
                .padding()
                .rotationEffect(Angle(radians: showingImage ? .pi : 0))
            Spacer()
        }
        .padding(.bottom, 8)
        .onTapGesture {
            self.showingImage.toggle()
            withAnimation { self.showingImage.toggle() }
        }
    }
    
    var products: some View {
        let favoriteProducts = store.products.filter { $0.isFavorite }
        return ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 0) {
                ForEach(favoriteProducts) { product in
                    NavigationLink(destination: ProductDetailView(product: product)){
                        self.eachProduct(product)
                    }
                }
            }
        }
    }
    
    func eachProduct(_ product: Product) -> some View {
      GeometryReader {
        ResizedImage(product.imageName, renderingMode: .original)
          .clipShape(Circle())
          .frame(width: 90, height: 90)
          .scaleEffect(self.scaledValue(from: $0))
      }
      .frame(width: 105, height: 105)
    }
    
    func scaledValue(from geometry: GeometryProxy) -> CGFloat {
      let xOffset = geometry.frame(in: .global).minX - 16
      let minSize: CGFloat = 0.5
      let maxSize: CGFloat = 1.0
      let delta: CGFloat = maxSize - minSize
      let size = minSize + delta * (1 - xOffset / UIScreen.main.bounds.width)
      return max(min(size, maxSize), minSize)
    }
}

struct FavoriteProductScrollView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
          FavoriteProductScrollView(showingImage: .constant(true))
          FavoriteProductScrollView(showingImage: .constant(false))
        }
        .environmentObject(Store())
    }
}
