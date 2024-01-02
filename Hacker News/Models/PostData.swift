//
//  PostData.swift
//  Hacker News
//
//  Created by KOPPOLA GOKUL SAI on 25/12/23.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
