//
//  FruitMartApp.swift
//  FruitMart
//
//  Created by Jun on 2020/10/31.
//

import SwiftUI

@main
struct FruitMartApp: App {
    var body: some Scene {
        WindowGroup {
            Home(store: Store())
        }
    }
}
