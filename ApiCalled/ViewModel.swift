//
//  ViewModel.swift
//  ApiCalled
//
//  Created by Bhumika Patel on 06/06/23.
//

import Foundation
import SwiftUI
struct Photo: Hashable, Codable {
 //   let id: UUID
    let albumId: Int
    let title: String
    let url: String
        
}

class ViewModel: ObservableObject {
    
    @Published var  isfav: Bool = false
    @Published var likedPhoto: [Photo] = []
    @Published var photo: [Photo] = []
    @Published var searchResults: String = ""
    func fetch() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let photo = try JSONDecoder().decode([Photo].self, from: data)
                DispatchQueue.main.async {
                    self?.photo = photo
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
           
    }
    var filterResult: [Photo] {
        if searchResults.isEmpty{
            return photo
        }else{
            return photo.filter{$0.title.contains(searchResults)}
        }
    }
}
