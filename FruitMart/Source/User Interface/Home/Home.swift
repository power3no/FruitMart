//
//  ContentView.swift
//  FruitMart
//
//  Created by Jun on 2020/10/31.
//

import SwiftUI

struct Home: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    @EnvironmentObject private var store: Store
    @State private var quickOrder: Product?
    @State private var showingFavoriteImage: Bool = true
    var body: some View {
        NavigationView{
            VStack {
                if showFavorite {
                    favoriteProducts
                }
                darkerDivider
                productList
            }
            .navigationBarTitle("과일마트")
        }
        .popupOverContext(item: $quickOrder, content: popupMessage(product:))
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

private extension Home {
    var favoriteProducts: some View {
        FavoriteProductScrollView(showingImage: $showingFavoriteImage)
            .padding(.top, 24)
            .padding(.bottom, 8)
    }
    
    var darkerDivider: some View {
        Color.primary
            .opacity(0.3)
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
    
    var productList: some View {
        List{
            ForEach(store.products){ product in
                HStack {
                    ProductRow(product: product, quickOrder: self.$quickOrder)
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        EmptyView()
                    }.frame(width: 0).hidden()
                }
            }
            .listRowBackground(Color.background)
        }
        .background(Color.background)
    }
    
    var showFavorite: Bool {
        !store.products.filter ({ $0.isFavorite }).isEmpty
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
