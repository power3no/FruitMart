//
//  FruitCard.swift
//  FruitMart
//
//  Created by Jun on 2020/11/08.
//

import SwiftUI

struct FruitCard: View {
    let imageName: String
    let size: CGSize
    let cornerRadius: CGFloat
    init(_ imangeName: String,
         size: CGSize = CGSize(width: 240, height: 200),
         cornerRadius: CGFloat = 14) {
        self.imageName = imangeName
        self.size = size
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        ResizedImage(imageName)
            .frame(width: size.width, height: size.height, alignment: .center)
            .cornerRadius(cornerRadius)
    }
}

struct FruitCard_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(productSamples) {
          FruitCard($0.imageName)
            .previewLayout(.fixed(width: 260, height: 220))
        }
    }
}
