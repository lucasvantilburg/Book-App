//
//  BookDetailView.swift
//  Book App
//
//  Created by Lucas Van Tilburg on 25/6/21.
//

import SwiftUI

struct BookDetailView: View {
    
    @EnvironmentObject var model:BookModel
    @ObservedObject var book:Book

    
    var body: some View {
        GeometryReader { geo in
            
            VStack (alignment: .leading) {
                /*Text(book.title)
                    .padding(.leading)
                    .padding(.bottom, geo.size.height/25)
                    .font(Font.custom("Avenir Heavy", size: 24))*/
                
                
                
                VStack {
                    Text("Read Now!")
                    NavigationLink(
                        destination: PageView(book: book),
                        label: {
                            Image("cover" + String(book.id))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                        })
                    
                    
                        
                }
                .frame(width: geo.size.width, height: geo.size.height / 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding([.top, .bottom], geo.size.height/25)
                
               
                
                VStack {
                    Text("Mark for later!")
                        .padding(.bottom, 10)
                    
                    Button(action: {
                        //book.isFavourite.toggle()
                        model.books[book.id-1].isFavourite.toggle()
                        print(book.isFavourite)
                        print(model.books[book.id-1].isFavourite)
                    }, label: {
                        Image(systemName: model.books[book.id-1].isFavourite ? "star" : "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .scaledToFit()
                    })
                    
                    
                    
                }
                .frame(width: geo.size.width, height: geo.size.height / 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.bottom, geo.size.height/15)
                
                
                VStack {
                    Text("Rate \(book.title)")
                        .bold()
                    Picker("", selection: $book.rating) {
                        Text("1").tag(1)
                        Text("2").tag(2)
                        Text("3").tag(3)
                        Text("4").tag(4)
                        Text("5").tag(5)
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding([.leading, .trailing], 50)
                }
            }
            .navigationBarTitle(book.title)
            //.navigationBarHidden(true)
        
        }
        
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: BookModel().books[4])
            
    }
}
