//
//  ContentView.swift
//  ApiCalled
//
//  Created by Bhumika Patel on 06/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        VStack{
            TabView {
              HomeView()
                    .tabItem {
                        
                        Label("Home", systemImage: "house")
                    }
                FavoriteButton().environmentObject(viewModel)
                    .tabItem {
                        
                        Label("Favourite", systemImage: "star")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
