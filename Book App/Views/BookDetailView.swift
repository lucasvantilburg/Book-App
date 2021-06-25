//
//  BookDetailView.swift
//  Book App
//
//  Created by Lucas Van Tilburg on 25/6/21.
//

import SwiftUI

struct BookDetailView: View {
    
    var book:Book
    
    var body: some View {
        GeometryReader { geo in
            
            VStack (alignment: .leading) {
                Text(book.title)
                
                VStack {
                    Text("Read Now!")
                    Image("cover" + String(book.id))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        
                }
                .frame(width: geo.size.width, height: geo.size.height - 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Text("Mark for later!")
                }
                
            }
        }
        
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: BookModel().books[0])
            
    }
}
