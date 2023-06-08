//
//  HomeView.swift
//  ApiCalled
//
//  Created by Bhumika Patel on 07/06/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment:.leading){
            
            NavigationView{
                List(viewModel.filterResult, id: \.self ){ photo in
                  //  ForEach(viewModel.photo, id: \.self ){ photo in
                        NavigationLink{
                            ApiDetailView(ph: photo).environmentObject(viewModel)
                        } label: {
                            
                                HStack{
                                    URLImage(urlString: photo.url)
                                    VStack(alignment:.leading){
                                     //   Text("title:")
                                        Text("albumId : \(photo.albumId)")
                                            .bold()
                                        Text("title : \(photo.title)")
                                            .bold()
                                        
                                   
                                    }
                                    Button(action: {
                                        self.viewModel.isfav.toggle()
                                    }){

                                    if viewModel.isfav{
                                        Image(systemName: "star.fill")
                                    }else{
                                        Image(systemName: "star")
                                    }
                                           
                                }
//
//                                    }
                            }
                            
                    //    }
                      
                        .padding(3)
                    }
                }
                .navigationTitle("Home")
                .searchable(text: $viewModel.searchResults)
                .onAppear{
                    viewModel.fetch()
                }
            }
        }
     //   .padding(10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
