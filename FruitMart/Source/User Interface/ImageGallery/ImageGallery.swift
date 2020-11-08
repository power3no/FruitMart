//
//  ImageGallery.swift
//  FruitMart
//
//  Created by Jun on 2020/11/08.
//

import SwiftUI

struct ImageGallery: View {
    static private let galleryImages: [String] = Store().products.map { $0.imageName}
    @State private var productImage: [String] = galleryImages
    @State private var spacing: CGFloat = 20
    @State private var scale: CGFloat = 0.020
    @State private var angle: CGFloat = 5
    @GestureState private var translation: CGSize = .zero
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                backgroundCards
                frontCard
            }
            Spacer()
//            controller
        }
        .edgesIgnoringSafeArea(.top)
    }
}

private extension ImageGallery {
    var frontCard: some View {
        let dragGesture = DragGesture()
            .updating($translation) { (value, state, _) in
                state = value.translation
            }
        return FruitCard(productImage[0])
            .offset(translation)
            .shadow(radius: 4, x: 2, y: 2)
            .onLongPressGesture(perform: { self.productImage.append(self.productImage.removeFirst())})
            .gesture(dragGesture)
    }
    
    var backgroundCards: some View {
        ForEach(productImage.dropFirst().reversed(), id: \.self) {
            self.backgroundCard(image: $0)
        }
    }
    
    func backgroundCard(image: String) -> some View {
        let index = productImage.firstIndex(of: image)!
        return FruitCard(image)
            .shadow(color: .primaryShadow, radius: 2, x: 2, y: 2)
            .offset(computePosition(index: index))
    }
    
    func computePosition(index: Int) -> CGSize {
        let x = translation.width
        let y = translation.height - CGFloat(index) * spacing
        return CGSize(width: x, height: y)
    }
}

struct ImageGallery_Previews: PreviewProvider {
    static var previews: some View {
        ImageGallery()
    }
}
