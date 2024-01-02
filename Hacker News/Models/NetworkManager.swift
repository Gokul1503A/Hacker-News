//
//  NetworkManager.swift
//  Hacker News
//
//  Created by KOPPOLA GOKUL SAI on 25/12/23.
//

import Foundation

class NetworkManager: ObservableObject{
    
   @Published var posts = [Post]()
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, Response, error in
                if let e = error{
                    print(e)
                    
                }
                else{
//                    parseJson(data)
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        }catch{
                            print(error)
                        }
                        
                        
                    }
                }
            }
            task.resume()
            
        }
    }
}
