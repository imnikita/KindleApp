//
//  Models.swift
//  KindleApp
//
//  Created by Nikita Popov on 18.03.2021.
//

import UIKit


struct Book {
    let title: String
    let author: String
    var pages: [Page]
    let coverImageURL: String
    
    init(dictionary: [String : Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String  ?? ""
        self.coverImageURL = dictionary["coverImageUrl"] as? String ?? ""
        
        pages = []
        
        if let pagesDictionaries = dictionary["pages"] as? [[String : Any]]{
            for pageDictionary in pagesDictionaries{
                if let safePageNumber = pageDictionary["id"] as? Int, let safeText = pageDictionary["text"] as? String{
                    let page = Page(pageNumber: safePageNumber, text: safeText)
                    pages.append(page)
                }
            }
        }
    }
}


struct Page {
    let pageNumber: Int
    let text: String
    
    init(pageNumber: Int, text: String) {
        self.pageNumber = pageNumber
        self.text = text
    }
}
