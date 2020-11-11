//
//  OrderListView.swift
//  FruitMart
//
//  Created by 이경준 on 2020/11/11.
//

import SwiftUI

struct OrderListView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        ZStack{
            if store.orders.isEmpty {
                emptyOrders
            } else {
                orderList
            }
        }
        .animation(.default)
        .navigationTitle("주문 목록")
    }
    var orderList: some View {
        List {
            ForEach(store.orders) {
                OrderRow(order: $0)
            }
        }
    }
    
    var emptyOrders: some View {
        VStack(spacing: 25) {
            Image("box")
                .renderingMode(.template)
                .foregroundColor(Color.gray.opacity(0.4))
            Text("주문 내역이 없습니다.")
                .font(.headline).fontWeight(.medium)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
    
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView()
    }
}
