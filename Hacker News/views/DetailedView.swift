//
//  DetailedView.swift
//  Hacker News
//
//  Created by KOPPOLA GOKUL SAI on 25/12/23.
//

import SwiftUI
import WebKit

struct DetailedView: View {
    var url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailedView(url: "bla")
}

struct WebView: UIViewRepresentable{
    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    func makeUIView(context: Context) ->  WebView.UIViewType {
        return WKWebView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
       if let safeString = urlString {
           if let url = URL(string: safeString){
               let request = URLRequest(url: url)
               uiView.load(request)
           }
       }
    }
}
