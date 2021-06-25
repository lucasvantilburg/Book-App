//
//  Book.swift
//  Book App
//
//  Created by Lucas Van Tilburg on 25/6/21.
//

import Foundation

class Book: Identifiable, Decodable {
    
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var id:UUID
    var content:[String]
    
}
