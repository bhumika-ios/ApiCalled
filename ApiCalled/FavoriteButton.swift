//
//  FavoriteButton.swift
//  ApiCalled
//
//  Created by Bhumika Patel on 07/06/23.
//

import SwiftUI


struct FavoriteButton: View {
    @EnvironmentObject var viewModel: ViewModel


    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                        Text("Favourites")
              
                    if viewModel.likedPhoto.isEmpty{
                      
                            Text("Not favorites yet..")

                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .padding(.top,10)
                                .multilineTextAlignment(.center)
                                .offset(y:250)
                    } else {
                      
                        VStack(spacing: 15){
                            
                            List(viewModel.filterResult, id: \.self ){ photo in
                                CardView(ph: photo)
                            }
                        }
                        .padding(.top,25)
                        .padding(.horizontal)
                    }
                }.padding()
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                Color("LightGray")
                    .ignoresSafeArea()
                )
        }
    }
    @ViewBuilder
    func CardView(ph: Photo)->some View{
        HStack(spacing: 15){
            URLImage(urlString: ph.url)
            
            VStack(alignment: .leading, spacing: 8){
                Text("albumId : \(ph.albumId)")
                Text("title : \(ph.title)")
                 
                    
                
                
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical,10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.white
                .cornerRadius(10)
        )
    }

}


struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton()  .environmentObject(ViewModel())
    }
}
