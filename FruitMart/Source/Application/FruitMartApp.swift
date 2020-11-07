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
            Home()
                .accentColor(Color.primary)
                .environmentObject(Store())
                
                
        }
    }
    
    private func configureAppearance() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "peach")!
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(named: "peach")!
        ]
    }
    
}
