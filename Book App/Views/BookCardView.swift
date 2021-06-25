//
//  BookCardView.swift
//  Book App
//
//  Created by Lucas Van Tilburg on 25/6/21.
//

import SwiftUI

struct BookCardView: View {
    
    var book:Book
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        
                    
                    VStack (alignment: .leading, spacing:0) {
                        Text(book.title)
                            .padding(.leading, 20)
                            .font(Font.custom("Avenir Heavy", size: 24))
                        
                        Text(book.author)
                            .padding(.leading, 20)
                            .font(Font.custom("Avenir", size: 14))
                        
                        Image("cover" + String(book.id))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .padding([.leading, .trailing, .top], 10)
                        
                    }
                    //.frame(width: geo.size.width - 50, height: 600, alignment: .center)
                }
            }
            .frame(width: geo.size.width - 50, height: 600, alignment: .center)
            .cornerRadius(15)
            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
        }
        
        
        
        
        
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        BookCardView(book: BookModel().books[0])
 
    }
}
