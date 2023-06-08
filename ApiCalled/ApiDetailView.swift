//
//  ApiDetailView.swift
//  ApiCalled
//
//  Created by Bhumika Patel on 07/06/23.
//
//
import SwiftUI

struct ApiDetailView: View {
    let ph : Photo
    @EnvironmentObject var sharedData: ViewModel
    var body: some View {
        VStack{
            URLImage(urlString: ph.url)
            Text("albumId : \(ph.albumId)")
            Text(ph.title)
                .padding()

            Button{
                addToLiked()
            } label: {
                if isLike(){
                   
                    Image(systemName: "star.fill")
                }else{
                    Image(systemName: "star")
                    
                }
                    
                
            }
//                }
//               
//            }
            Spacer()
            
        }
    }
    func isLike()->Bool{
        return sharedData.likedPhoto.contains { photo in
            return self.ph.title == photo.title
            
        }
    }
    func addToLiked(){
        if let index = sharedData.likedPhoto.firstIndex(where: { photo in
            return self.ph.title == photo.title
        }){
            // remove
            sharedData.likedPhoto.remove(at: index)
        } else {
            //add
            sharedData.likedPhoto.append(ph)
        }
    }
}

//struct ApiDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ApiDetailView()
//    }
//}
