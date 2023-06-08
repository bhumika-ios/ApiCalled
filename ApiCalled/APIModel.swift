//
//  APIModel.swift
//  ApiCalled
//
//  Created by Bhumika Patel on 06/06/23.
//

import Foundation
import SwiftUI
struct URLImage: View{
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data  = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .clipShape(Circle())
            
        }else{
            Image(systemName: "image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .clipShape(Circle())
                .onAppear{
                    fetchData()
                }
        }
    }
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

