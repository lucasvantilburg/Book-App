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
                                                Text(b.title)
                                                    .padding(.leading, 10)
                                                    .font(Font.custom("Avenir Heavy", size: 24))
                                                
                                                Text(b.author)
                                                    .padding(.leading, 10)
                                                    .font(Font.custom("Avenir", size: 14))
                                                
                                                Image("cover" + String(b.id))
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .clipped()
                                                    .padding([.leading, .trailing, .top], 10)
                                                
                                            }
                                            .foregroundColor(.black)
                                            
                                        }
                                        .frame(width: geo.size.width - 50, height: 600, alignment: .center)
                                        .cornerRadius(15)
                                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                                    })
                                    .padding(10)
                                    
                            }
                        }
                    }
                }
                    
            }
            .navigationBarTitle("My Library")
            .navigationBarHidden(true)
        }
        
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookModel())
    }
}
