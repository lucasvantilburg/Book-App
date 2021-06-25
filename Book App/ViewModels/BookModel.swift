//
//  BookModel.swift
//  Book App
//
//  Created by Lucas Van Tilburg on 25/6/21.
//

import Foundation

class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        self.books = DataService.getLocalData()
        //print(self.books[0].title)
    }
}
