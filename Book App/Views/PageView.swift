//
//  PageView.swift
//  Book App
//
//  Created by Lucas Van Tilburg on 26/6/21.
//

import SwiftUI

struct PageView: View {
    
    var book:Book
    @State var pageIndex = 0
    
    var body: some View {
        TabView (selection: $pageIndex) {
            ForEach(0..<book.content.count) { index in
                VStack {
                    ScrollView {
                        Text(book.content[index])
                            .padding(.bottom)
                        Text(String(index+1))
                    }
                    
                }
                .padding()
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(book: BookModel().books[0])
    }
}
