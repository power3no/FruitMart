//
//  MyPage.swift
//  FruitMart
//
//  Created by 이경준 on 2020/11/11.
//

import SwiftUI

struct MyPage: View {
    var body: some View {
        NavigationView {
            Form {
                orderInfoSection
            }
            .navigationTitle("마이페이지")
        }
    }
    
    var orderInfoSection: some View {
        Section(header: Text("주문정보").fontWeight(.medium)) {
            NavigationLink(destination: OrderListView()) {
                Text("주문 목록")
            }
            .frame(height: 44)
        }
    }
}

struct MyPage_Previews: PreviewProvider {
    static var previews: some View {
        MyPage()
    }
}
