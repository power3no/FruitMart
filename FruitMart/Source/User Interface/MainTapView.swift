//
//  MainTapView.swift
//  FruitMart
//
//  Created by Jun on 2020/11/07.
//

import SwiftUI

struct MainTapView: View {
    private enum Tabs {
        case home, recipe, galley, myPage
    }
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group{
                home
                recipe
                imageGallery
                myPage
            }
            .accentColor(.primary)
        }
        .accentColor(.peach)
        .edgesIgnoringSafeArea(.top)
//        .statusBar(hidden: false)
    }
}

fileprivate extension View {
    func tabItem(image: String, text: String) -> some View {
        self.tabItem {
            Symbol(image, scale: .large)
                .font(Font.system(size: 17, weight: .light))
            Text(text)
        }
    }
}

private extension MainTapView {
    var home: some View {
        Home()
            .tag(Tabs.home)
            .tabItem(image: "house", text: "홈")
            .onAppear{ UITableView.appearance().separatorStyle = .none}
    }
    
    var recipe: some View {
        RecipeView()
            .tag(Tabs.recipe)
            .tabItem(image: "book", text: "레시피")
    }
    
    var imageGallery: some View {
        ImageGallery()
            .tag(Tabs.galley)
            .tabItem(image: "photo.on.rectangle", text: "갤러리")
    }
    
    var myPage: some View {
        Text("마이페이지")
            .tag(Tabs.myPage)
            .tabItem(image: "person", text: "마이페이지")
    }
}

struct MainTapView_Previews: PreviewProvider {
    static var previews: some View {
        MainTapView().environmentObject(Store())
    }
}
