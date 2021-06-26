//
//  BookDetailView.swift
//  Book App
//
//  Created by Lucas Van Tilburg on 25/6/21.
//

import SwiftUI

struct BookDetailView: View {
    
    @State var book:Book
    
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
                        .padding(.bottom, 10)
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
                .frame(width: geo.size.width, height: geo.size.height - 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Text("Rate \(book.title)")
                    Picker("", selection: $book.rating) {
                        Text("1").tag(1)
                        Text("2").tag(2)
                        Text("3").tag(3)
                        Text("4").tag(4)
                        Text("5").tag(5)
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
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
