//
//  ContentView.swift
//  Hacker News
//
//  Created by KOPPOLA GOKUL SAI on 25/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailedView(url: post.url)) {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                    
            }
            .navigationBarTitle("Hacker News")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        .onAppear(perform: {
            
            self.networkManager.fetchData()
        })
        
        
        
    }
}


#Preview {
    ContentView()
}

