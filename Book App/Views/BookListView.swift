//
//  ContentView.swift
//  Book App
//
//  Created by Lucas Van Tilburg on 25/6/21.
//

import SwiftUI

struct BookListView: View {
    
    @EnvironmentObject var model:BookModel
    //@ObservedObject var model = BookModel()
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                Text("My Library")
                    .padding()
                    .font(Font.custom("Avenir Heavy", size: 26))
                
                GeometryReader { geo in
                    ScrollView {
                        LazyVStack {
                            ForEach (model.books) { b in
                                
                                NavigationLink(
                                    destination: BookDetailView(book: b),
                                    label: {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                
                                            
                                            VStack (alignment: .leading, spacing:0) {
                                                HStack {
                                                    VStack (alignment: .leading) {
                                                        Text(b.title)
                                                            .padding(.leading, geo.size.width/30)
                                                            .font(Font.custom("Avenir Heavy", size: 24))
                                                        
                                                        Text(b.author)
                                                            .padding(.leading, geo.size.width/30)
                                                            .font(Font.custom("Avenir", size: 14))
                                                    }
                                                    if (b.isFavourite) {
                                                        Image(systemName: "star")
                                                            .resizable()
                                                            .foregroundColor(.yellow)
                                                            .scaledToFit()
                                                    }
                                                }
                                                
                                                Image("cover" + String(b.id))
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .clipped()
                                                    .padding([.leading, .trailing], geo.size.width/30)
                                                    .padding(.top, geo.size.height/40)
                                                
                                            }
                                            .foregroundColor(.black)
                                            
                                        }
                                        .frame(width: geo.size.width/1.2, height: geo.size.height/1.3, alignment: .center)
                                        .cornerRadius(15)
                                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                                    })
                                    .padding(geo.size.height/45)
                                    
                            }
                        }
                    }
                }
                    
            }
            .navigationBarTitle("My Library")
            .navigationBarHidden(true)
            //.navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookModel())
    }
}
