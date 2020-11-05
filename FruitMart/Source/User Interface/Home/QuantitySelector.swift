//
//  QuantitySelector.swift
//  FruitMart
//
//  Created by 이경준 on 2020/11/05.
//

import SwiftUI

struct QuantitySelector: View {
    @Binding var quantity: Int
    var range: ClosedRange<Int> = 1...20
    
    var body: some View {
        HStack {
            Button(action: { changeQuantity(-1) }, label: {
                Image(systemName: "minus.circle.fill")
                    .imageScale(.large)
                    .padding()
            })
            .foregroundColor(Color.gray.opacity(0.5))
            
            Text("\(quantity)")
                .bold()
                .font(Font.system(.title, design: .monospaced))
                .frame(width: 40, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Button(action: { self.changeQuantity(1) }, label: {
                Image(systemName: "plus.circle.fill")
                    .imageScale(.large)
                    .padding()
            })
            .foregroundColor(Color.gray.opacity(0.5))
        }
    }
    
    private func changeQuantity(_ num: Int) {
        if range ~= quantity + num {
            quantity += num
        }
    }
}

struct QuantitySelector_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            QuantitySelector(quantity: .constant(1))
            QuantitySelector(quantity: .constant(10))
            QuantitySelector(quantity: .constant(20))
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
